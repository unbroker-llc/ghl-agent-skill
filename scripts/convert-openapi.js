#!/usr/bin/env node
// convert-openapi.js — Converts an OpenAPI 3.x JSON file to LLM-friendly markdown.
// Usage: node convert-openapi.js <input.json>

const fs = require('fs');
const path = require('path');

const inputFile = process.argv[2];
if (!inputFile) {
  console.error('Usage: node convert-openapi.js <input.json>');
  process.exit(1);
}

const spec = JSON.parse(fs.readFileSync(inputFile, 'utf8'));
const name = path.basename(inputFile, '.json');

let md = '';

// Title
md += `# ${spec.info?.title || name}\n\n`;
if (spec.info?.description) md += `${spec.info.description}\n\n`;
if (spec.info?.version) md += `Version: ${spec.info.version}\n\n`;

// Servers
if (spec.servers?.length) {
  md += '## Base URL\n\n';
  for (const s of spec.servers) {
    md += `- ${s.url}${s.description ? ` (${s.description})` : ''}\n`;
  }
  md += '\n';
}

// Auth
if (spec.components?.securitySchemes) {
  md += '## Authentication\n\n';
  for (const [sname, scheme] of Object.entries(spec.components.securitySchemes)) {
    let line = `- **${sname}**: ${scheme.type}`;
    if (scheme.scheme) line += ` (${scheme.scheme})`;
    if (scheme.bearerFormat) line += ` [${scheme.bearerFormat}]`;
    if (scheme.description) line += ` — ${scheme.description}`;
    md += line + '\n';
  }
  md += '\n';
}

// Schema printer
function printSchema(schema, schemas, depth) {
  depth = depth || 0;
  if (depth > 2) return '_(nested object)_\n';
  let out = '';

  if (schema.$ref) {
    const refName = schema.$ref.split('/').pop();
    const resolved = schemas[refName];
    if (resolved) {
      out += `Schema: \`${refName}\`\n\n`;
      return out + printSchema(resolved, schemas, depth);
    }
    return `Schema: \`${refName}\`\n\n`;
  }

  if (schema.allOf) {
    for (const sub of schema.allOf) {
      out += printSchema(sub, schemas, depth);
    }
    return out;
  }

  if (schema.oneOf || schema.anyOf) {
    const variants = schema.oneOf || schema.anyOf;
    out += 'One of:\n\n';
    for (const sub of variants) {
      out += printSchema(sub, schemas, depth + 1);
    }
    return out;
  }

  if (schema.properties) {
    out += '| Property | Type | Required | Description |\n';
    out += '|----------|------|----------|-------------|\n';
    const req = new Set(schema.required || []);
    for (const [prop, def] of Object.entries(schema.properties)) {
      let type = def.type || 'object';
      if (def.enum) type += ` (enum: ${def.enum.slice(0, 8).join(', ')}${def.enum.length > 8 ? ', ...' : ''})`;
      if (def.$ref) type = def.$ref.split('/').pop();
      if (def.items?.$ref) type = `array<${def.items.$ref.split('/').pop()}>`;
      if (def.items?.type) type = `array<${def.items.type}>`;
      const desc = (def.description || '-').replace(/\n/g, ' ').replace(/\|/g, '\\|');
      out += `| \`${prop}\` | ${type} | ${req.has(prop) ? 'Yes' : 'No'} | ${desc} |\n`;
    }
    out += '\n';
  }
  return out;
}

// Endpoints
if (spec.paths) {
  md += '## Endpoints\n\n';
  for (const [epath, methods] of Object.entries(spec.paths)) {
    for (const [method, op] of Object.entries(methods)) {
      if (!['get', 'post', 'put', 'patch', 'delete'].includes(method)) continue;
      md += `### ${method.toUpperCase()} \`${epath}\`\n\n`;
      if (op.summary) md += `${op.summary}\n\n`;
      if (op.description) md += `${op.description}\n\n`;
      if (op.operationId) md += `Operation ID: \`${op.operationId}\`\n\n`;

      // Parameters
      const params = op.parameters || [];
      if (params.length) {
        md += '**Parameters:**\n\n';
        md += '| Name | In | Type | Required | Description |\n';
        md += '|------|-----|------|----------|-------------|\n';
        for (const p of params) {
          const type = p.schema?.type || p.schema?.$ref?.split('/').pop() || '-';
          const desc = (p.description || '-').replace(/\n/g, ' ').replace(/\|/g, '\\|');
          md += `| \`${p.name}\` | ${p.in} | ${type} | ${p.required ? 'Yes' : 'No'} | ${desc} |\n`;
        }
        md += '\n';
      }

      // Request body
      if (op.requestBody) {
        md += '**Request Body';
        if (op.requestBody.required) md += ' (required)';
        md += ':**\n\n';
        const content = op.requestBody.content || {};
        for (const [ct, media] of Object.entries(content)) {
          md += `Content-Type: \`${ct}\`\n\n`;
          if (media.schema) {
            md += printSchema(media.schema, spec.components?.schemas || {});
          }
        }
        md += '\n';
      }

      // Responses
      if (op.responses) {
        md += '**Responses:**\n\n';
        for (const [code, resp] of Object.entries(op.responses)) {
          md += `- \`${code}\`: ${resp.description || ''}\n`;
        }
        md += '\n';
      }
      md += '---\n\n';
    }
  }
}

// Schemas appendix
const schemas = spec.components?.schemas || {};
if (Object.keys(schemas).length) {
  md += '## Schemas\n\n';
  for (const [sname, schema] of Object.entries(schemas)) {
    md += `### ${sname}\n\n`;
    if (schema.description) md += `${schema.description}\n\n`;
    md += printSchema(schema, schemas);
    md += '\n';
  }
}

process.stdout.write(md);
