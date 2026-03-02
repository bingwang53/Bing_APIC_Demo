# Publish to IBM API Connect SaaS

This guide gives you two ways to publish:

- APIC UI flow (best for first-time setup)
- APIC CLI flow (best for repeatable demo runs)

## Prerequisites

- IBM API Connect SaaS instance
- Provider organization, Catalog, and Space
- Gateway service configured for your Catalog/Space
- Product Owner or equivalent publish permissions

## Files used by APIC

- API: `openapi/partner-integration-v1.yaml`
- Product: `apic/product.yaml`

## 1. APIC UI publish flow

1. In API Manager, open your Provider Org and target Catalog/Space.
2. Create API from `openapi/partner-integration-v1.yaml`.
3. Create Product from `apic/product.yaml` and attach the API.
4. Confirm plans (`sandbox`, `standard`, `premium`) and save.
5. Publish Product to the target Catalog/Space.

## 2. APIC built-in test tool

1. Open the published API operation in API Manager.
2. Click `Test`.
3. Set path/header params and auth:
   - `partnerId = partner-123`
   - `X-Partner-Id = partner-123`
   - `Authorization = Bearer <access_token>`
4. Send `POST /v1/partners/{partnerId}/orders` first.
5. Verify status code and payload in the test response panel.

## 3. APIC CLI publish flow (PowerShell)

Run the helper script:

```powershell
.\scripts\publish-apic.ps1 `
  -ManagementServer "https://YOUR-MGMT-ENDPOINT" `
  -ProviderOrg "YOUR_PROVIDER_ORG" `
  -Catalog "YOUR_CATALOG" `
  -Space "YOUR_SPACE" `
  -Username "YOUR_USERNAME"
```

Notes:

- The script runs in dry-run mode by default.
- Add `-Execute` to run APIC commands for real.
- If your IdP realm differs, pass `-Realm`.

## 4. Post-publish smoke test

Use `examples/requests.http` with your APIC invoke URL and token:

- Set `@baseUrl` to gateway invoke URL
- Set `@token` to OAuth access token
- Send `APIC smoke test: list orders`
