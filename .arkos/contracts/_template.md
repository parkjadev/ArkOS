# Contract: <interface-name>

<!-- Copy this file to .arkos/contracts/<interface-name>.<ext> and fill it in. -->
<!-- Use the format that matches your stack:                                     -->
<!--   REST API       -> OpenAPI YAML/JSON  (.openapi.yml / .openapi.json)      -->
<!--   Event/message  -> AsyncAPI YAML      (.asyncapi.yml)                     -->
<!--   Internal types -> JSON Schema        (.schema.json)                      -->
<!--   gRPC / Protobuf -> .proto file       (.proto)                            -->
<!-- This markdown file is for teams that prefer a human-readable summary first. -->

## Summary

| Field | Value |
|---|---|
| Interface name | |
| Owner | |
| Spec | SPEC-NNNN |
| Direction | inbound / outbound / bidirectional |
| Protocol | REST / gRPC / GraphQL / event / other |
| Auth | none / API key / OAuth2 / mTLS / other |

## Endpoints / operations

<!-- List each endpoint or operation. Add rows as needed. -->

| Method / event | Path / topic | Request | Response / payload |
|---|---|---|---|
| | | | |

## Schema stub

<!-- Paste or link your OpenAPI / JSON Schema / Protobuf definition below. -->
<!-- For REST, a minimal OpenAPI 3.1 stub: -->

```yaml
openapi: "3.1.0"
info:
  title: <interface-name>
  version: "0.1.0"
paths:
  /example:
    get:
      summary: Replace with your operation
      responses:
        "200":
          description: OK
```

## Gate reference

This contract satisfies constitution principle 3 ("Contracts before code") and
ship gate criterion CRT-022 where this interface crosses a trust boundary.
Replace or remove this file once a machine-readable contract file is in place.
