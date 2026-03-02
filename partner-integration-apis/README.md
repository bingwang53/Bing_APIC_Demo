# Partner Integration APIs (IBM API Connect SaaS)

This repo is an APIC-ready demo package for partner order-to-settlement APIs.

- `openapi/partner-integration-v1.yaml`: OpenAPI contract with `x-ibm-configuration`
- `apic/product.yaml`: API Product with `sandbox`, `standard`, and `premium` plans
- `examples/requests.http`: APIC gateway request samples for VS Code REST Client
- `docs/publish-to-apic.md`: step-by-step publish + test guide
- `scripts/publish-apic.ps1`: APIC CLI publish helper

## Quick start

1. Set your backend endpoint in `openapi/partner-integration-v1.yaml`.
2. Publish the API + Product using the APIC UI or `scripts/publish-apic.ps1`.
3. Create/subscribe a consumer app in Developer Portal.
4. Generate an OAuth token for that app.
5. Set `@baseUrl` and `@token` in `examples/requests.http` and send requests.

## Validation

- GitHub workflow: `.github/workflows/openapi-ci.yml`
- Lint rules: `.spectral.yaml`
