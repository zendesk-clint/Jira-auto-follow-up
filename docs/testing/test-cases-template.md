# Test Cases Template

| Test ID | Category | Scenario | Preconditions | Steps | Expected Result | Priority | Security Mapping |
|---|---|---|---|---|---|---|---|
| TC-001 | Scheduler | Bi-weekly trigger executes | Scheduler configured | Wait for schedule or trigger manually | Single run starts with run ID | High | N/A |
| TC-002 | Scheduler | Duplicate trigger handling | One run already in progress | Trigger again | Duplicate run prevented or deduped | High | N/A |
| TC-003 | Jira API | Fetch issues with valid JQL | Valid credentials and query | Execute retrieval | Issues returned with required fields | High | N/A |
| TC-004 | Jira API | Missing assignee | Issue without assignee exists | Execute retrieval and notify | Fallback message and warning log | Medium | N/A |
| TC-005 | Slack Delivery | User mention success | Mapping exists for assignee | Send notification | Mention includes correct Slack user | High | N/A |
| TC-006 | Slack Delivery | Rate limit handling | Slack returns HTTP 429 | Trigger send loop | Backoff/retry then success/fail log | High | N/A |
| TC-007 | Security | Credential leak prevention | CI secret scan enabled | Commit fake secret in test branch | CI blocks merge and reports finding | High | T1552 |
| TC-008 | Security | Unauthorized token use detection | Monitoring configured | Use invalid or revoked token | Auth failure logged and alert generated | High | T1078 |
| TC-009 | Security | Injection-like payload handling | Malicious ticket text prepared | Process ticket notification | Text safely encoded/sanitized | High | T1059/T1190 |
| TC-010 | Security | Data minimization | Sensitive field exists in issue | Build notification payload | Sensitive data not posted to Slack | High | T1041 |

## Execution Notes

- Replace placeholders with environment-specific details.
- Capture evidence links (logs, screenshots, payload samples) for each test run.
- Record defects in Jira and link them to failing test IDs.
