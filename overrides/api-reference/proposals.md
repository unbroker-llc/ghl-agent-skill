## SendDocumentDto.medium

The `medium` field accepts the following values:

- `link`
- `email`
- `sms`
- `sms_and_email`

The upstream docs incorrectly list only `link` and `email`. The value `sms_and_email` is also valid and sends the document via both SMS and email, similar for `sms`.
