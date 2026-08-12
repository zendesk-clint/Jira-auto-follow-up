# MITRE ATT&CK Risk Register Template

Use this register to track security risks relevant to the Jira/Slack automation.

## Risk Register

| Risk ID | ATT&CK Technique | Threat Scenario | Likelihood | Impact | Existing Controls | Required Mitigation | Owner | Status |
|---|---|---|---|---|---|---|---|---|
| R-001 | T1078 Valid Accounts | Compromised service account sends unauthorized notifications | Medium | High | SSO + limited scopes | Rotate tokens + anomaly alerting | Security | Open |
| R-002 | T1552 Unsecured Credentials | API token appears in logs/repo | Medium | High | Secret manager | Add secret scan in CI + log redaction tests | DevOps | Open |
| R-003 | T1190 Exploit Public-Facing App | Middleware endpoint abused for unauthorized trigger | Low | High | Auth required | Add signed requests + WAF + rate limit | Engineering | Open |
| R-004 | T1059 Command/Scripting Abuse | Malicious ticket text triggers unsafe behavior | Medium | Medium | Basic input handling | Add strict sanitization + output encoding | Engineering | Open |
| R-005 | T1565 Data Manipulation | Jira field tampering alters recipient or content | Low | Medium | Jira change history | Add validation + suspicious update alerts | Product/Eng | Open |
| R-006 | T1041 Exfiltration over C2 | Sensitive ticket content leaked via Slack messages | Low | High | Channel access controls | Data minimization + masking policy | Security | Open |

## Acceptance Criteria

- All high/critical risks must have approved mitigations before production.
- Control owners must provide evidence links for each closed risk.
- AppSec signoff is required for production deployment.

## Evidence Links

- Threat model:
- Penetration test report:
- CI security scan logs:
- Access review record:
