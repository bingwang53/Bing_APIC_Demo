# API Connect deployment notes

- Product file: `apic/product.yaml`
- API contract: `openapi/partner-integration-v1.yaml`

## Import flow (SaaS)
1. Create API from OpenAPI file.
2. Create Product and attach the API.
3. Configure plans: sandbox, standard, premium.
4. Publish to Catalog and Space.
5. Subscribe from Developer Portal app.

## Runtime policy checklist
- OAuth/JWT validation
- Header validation (`X-Partner-Id`)
- Rate limiting by plan
- Logging / analytics
