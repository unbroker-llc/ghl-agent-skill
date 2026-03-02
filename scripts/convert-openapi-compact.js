#!/usr/bin/env node
// convert-openapi-compact.js — Converts OpenAPI JSON to a compact endpoint listing.
// Outputs: one line per endpoint with method, path, operationId, summary.
// Plus a compact schema section with just property names and types.

const fs = require('fs');
const path = require('path');

const inputFile = process.argv[2];
if (!inputFile) { process.exit(1); }

const spec = JSON.parse(fs.readFileSync(inputFile, 'utf8'));
const name = path.basename(inputFile, '.json');
const title = spec.info?.title || name;

let md = `## ${title}\n\n`;

// Endpoints as a compact table
if (spec.paths) {
  md += '| Method | Path | Operation ID | Summary |\n';
  md += '|--------|------|-------------|----------|\n';
  for (const [ep, methods] of Object.entries(spec.paths)) {
    for (const [method, op] of Object.entries(methods)) {
      if (!['get','post','put','patch','delete'].includes(method)) continue;
      const summary = (op.summary || '-').replace(/\|/g, '\\|').replace(/\n/g, ' ');
      md += `| ${method.toUpperCase()} | \`${ep}\` | ${op.operationId || '-'} | ${summary} |\n`;
    }
  }
  md += '\n';
}

// Compact request body info — only for POST/PUT/PATCH, just property names
if (spec.paths) {
  const bodies = [];
  for (const [ep, methods] of Object.entries(spec.paths)) {
    for (const [method, op] of Object.entries(methods)) {
      if (!['post','put','patch'].includes(method)) continue;
      if (!op.requestBody?.content) continue;
      const content = op.requestBody.content;
      const mediaType = content['application/json'] || content[Object.keys(content)[0]];
      if (!mediaType?.schema) continue;
      const schema = resolveSchema(mediaType.schema, spec.components?.schemas || {});
      if (!schema?.properties) continue;
      const props = Object.entries(schema.properties).map(([k, v]) => {
        let t = v.type || (v.$ref ? v.$ref.split('/').pop() : 'object');
        if (v.enum) t += `(${v.enum.join('|')})`;
        if (v.items?.type) t = `${v.items.type}[]`;
        if (v.items?.$ref) t = `${v.items.$ref.split('/').pop()}[]`;
        const req = (schema.required || []).includes(k) ? '*' : '';
        return `${k}${req}:${t}`;
      });
      bodies.push(`**${method.toUpperCase()} \`${ep}\`**: ${props.join(', ')}`);
    }
  }
  if (bodies.length) {
    md += '**Request bodies** (* = required):\n\n';
    for (const b of bodies) md += `${b}\n\n`;
  }
}

process.stdout.write(md);

function resolveSchema(schema, schemas) {
  if (schema.$ref) {
    const refName = schema.$ref.split('/').pop();
    return schemas[refName] || schema;
  }
  if (schema.allOf) {
    let merged = {};
    for (const sub of schema.allOf) {
      const resolved = resolveSchema(sub, schemas);
      merged.properties = { ...merged.properties, ...resolved.properties };
      merged.required = [...(merged.required || []), ...(resolved.required || [])];
    }
    return merged;
  }
  return schema;
}
