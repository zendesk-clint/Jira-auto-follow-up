# Operations Runbook Template

## 1. Service Overview

- **Service Name**:
- **Repository**:
- **Primary Slack Channel**: `#sspm-app-owners`
- **Schedule**: Every two weeks
- **Owners**:

## 2. Dependencies

- Jira API endpoint(s)
- Slack API endpoint(s)
- Secret manager
- Monitoring and alerting platform

## 3. Standard Operating Procedure

1. Verify scheduler health before expected run window.
2. Check secrets are valid and unexpired.
3. Trigger dry-run in staging before production changes.
4. Confirm message delivery and logging after each production run.

## 4. Incident Response

### Common Failure Modes

- Jira authentication failure
- Slack rate limits or API outage
- Mapping failures for assignees
- Duplicate or missing notifications

### Triage Checklist

- [ ] Check recent deployment or configuration change.
- [ ] Inspect run logs by correlation ID.
- [ ] Validate Jira and Slack API status.
- [ ] Verify secret expiration and token scope.
- [ ] Confirm idempotency keys are generated correctly.

## 5. Rollback Procedure

1. Disable scheduler trigger.
2. Revert to last known-good release.
3. Rotate integration credentials if compromise is suspected.
4. Re-enable scheduler only after validation in staging.

## 6. Security Escalation

- Escalation channel:
- AppSec contact:
- Incident severity matrix:
- Evidence retention location:

## 7. Post-Incident Tasks

- [ ] Capture root cause analysis.
- [ ] Update tests to prevent recurrence.
- [ ] Update threat model and ATT&CK mappings.
- [ ] Review required control changes with security team.
