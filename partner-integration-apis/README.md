# Partner Integration APIs (IBM API Connect SaaS)

Starter repository for Partner Integration APIs:

- `openapi/partner-integration-v1.yaml` - OpenAPI 3.0 contract
- `apic/product.yaml` - API Connect Product + plans scaffold
- `docs/design.md` - domain and governance notes
- `examples/requests.http` - sample API calls

## Quick start

1. Review and edit the OpenAPI contract.
2. Update APIC product/plan definitions to match your org.
3. Import API + Product into IBM API Connect SaaS.
4. Use GitHub Actions workflow `.github/workflows/openapi-ci.yml` to lint and validate OpenAPI on push/PR.

## Suggested next steps

- Add mock backend or gateway assembly
- Add CI linting for OpenAPI
- Add contract tests
