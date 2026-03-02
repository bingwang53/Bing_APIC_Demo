# Partner Integration API Design Notes

## Scope
- Partner order intake
- Order status retrieval
- Settlement reporting
- Sales reporting
- Webhook registration and testing

## Baseline Security
- OAuth2 Client Credentials
- Scope-based authorization
- Optional mTLS for premium tier

## Governance
- Enforce `X-Partner-Id` and path `partnerId` consistency
- Use `Idempotency-Key` for order creation
- Centralized error payload with correlation id

## API Product Plans (initial)
- Sandbox: low rate, test use
- Standard: production baseline
- Premium: highest limits + optional mTLS
