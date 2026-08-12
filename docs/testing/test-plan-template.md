# Test Plan Template: Jira -> Slack Bi-Weekly Notifications

## 1. Scope

Validate functional behavior, integration reliability, and security controls for
the bi-weekly assignee notification automation.

## 2. Test Levels

- Unit tests
- Integration tests
- End-to-end tests
- Security tests (SAST/DAST/abuse cases/pen testing)

## 3. Environments

- **Dev**: local validation and unit tests
- **Staging**: full Jira + Slack integration and security scans
- **Production**: smoke checks only, no destructive tests

## 4. Entry Criteria

- Required documentation templates completed
- Credentials provisioned via secret manager
- Build artifacts generated and signed
- CI baseline checks passing

## 5. Exit Criteria

- All critical/high defects resolved or approved exception recorded
- Functional pass rate meets target
- Security findings triaged and remediated
- AppSec and engineering signoff received

## 6. Test Categories and Examples

1. **Scheduler**
   - Validate two-week trigger cadence.
   - Verify duplicate trigger does not create duplicate notifications.
2. **Data Retrieval**
   - Validate JQL query returns expected issue set.
   - Handle missing assignee safely.
3. **Slack Delivery**
   - Mention resolved assignee correctly.
   - Retry correctly on 429 and 5xx responses.
4. **Security**
   - Validate token scope is least privilege.
   - Validate malicious input does not break formatting or logic.

## 7. Security Testing Matrix

| Test Type | ATT&CK Vector Focus | Tool/Method | Pass Criteria |
|---|---|---|---|
| Secret Exposure | T1552 | Secret scanning in CI | No plaintext secrets in repo/history |
| Account Abuse | T1078 | Auth/log review + anomaly simulation | Alerts fire on suspicious access |
| Injection/Abuse Input | T1059/T1190 | Fuzz or crafted Jira fields | Input sanitized; no unsafe behavior |
| Data Exfiltration | T1041 | Payload review and DLP checks | Sensitive fields are masked/minimized |

## 8. Defect Management

- Track issues in Jira with severity labels.
- Attach reproducible steps and evidence.
- Re-test all fixed issues before release signoff.
