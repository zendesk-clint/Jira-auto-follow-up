# Architecture Template: Jira -> Slack Assignee Notification

## 1. Objective

Describe how the integration delivers bi-weekly notifications for Jira assignees
to `#sspm-app-owners`.

## 2. Components

- **Scheduler**: Trigger every two weeks.
- **Integration Service**: Queries Jira, maps assignee identities, posts messages.
- **Jira API**: Source of ticket and assignee data.
- **Slack API**: Message delivery target.
- **Logging + Monitoring**: Metrics, alerts, and audit evidence.

## 3. High-Level Flow

1. Scheduler starts a run and generates a correlation ID.
2. Service loads JQL and fetches Jira issues.
3. Service resolves assignee to Slack user ID.
4. Service composes message and posts to `#sspm-app-owners`.
5. Service records outcome and emits metrics/events.

## 4. Data Contracts

### Jira Input

- `issueKey`
- `summary`
- `assignee.accountId`
- `status`
- `priority`
- `dueDate`
- `issueUrl`

### Slack Output

- `channel`: `#sspm-app-owners`
- `text`: include mention, issue key, summary, URL
- `metadata` (optional): run ID and issue key for traceability

## 5. Non-Functional Requirements

- Idempotency across duplicate triggers
- Retry policy for 429/5xx responses
- Operational telemetry (success rate, latency, failures)

## 6. Security Design Controls

- Least-privilege service accounts for Jira and Slack
- Secret manager-backed token retrieval
- Input sanitization for untrusted Jira fields
- Centralized immutable audit logs

## 7. Open Questions

- [ ] Where should the assignee-to-Slack mapping source of truth live?
- [ ] What is the final fallback behavior for unresolvable assignees?
- [ ] Which team owns on-call for failed runs?
