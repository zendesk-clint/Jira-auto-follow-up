# Jira Auto Follow-Up

Repository scaffold for a bi-weekly Slack + Jira automation that notifies Jira
ticket assignees in `#sspm-app-owners`.

## Purpose

This repo is structured to support:

- automation implementation code,
- CI/CD workflows,
- security-by-design documentation,
- test planning and execution tracking.

## Project Scope

Target behavior:

1. Run every two weeks.
2. Query Jira for eligible tickets.
3. Resolve assignee identity for Slack mention.
4. Post structured notifications to `#sspm-app-owners`.
5. Log outcomes and trigger alerts on failures/security anomalies.

## Repository Layout

```text
.
├── .github/workflows/
│   ├── ci.yml
│   └── deploy.yml
├── config/
│   ├── jira-query.example.jql
│   └── slack-message.template.md
├── docs/
│   ├── architecture-template.md
│   ├── runbook-template.md
│   ├── security/
│   │   └── mitre-attack-risk-register-template.md
│   └── testing/
│       ├── test-cases-template.md
│       └── test-plan-template.md
├── scripts/
│   └── validate_docs.sh
└── src/
    └── automation/
        └── README.md
```

## Quick Start

1. Copy template docs in `docs/` and fill project-specific values.
2. Replace example files in `config/` with environment-specific configs.
3. Add implementation code under `src/automation/`.
4. Run local checks:

   ```bash
   bash scripts/validate_docs.sh
   ```

## Security Expectations

Before production deployment, complete:

- MITRE ATT&CK risk review (`docs/security/...`),
- secret handling and least-privilege validation,
- penetration and abuse-case testing from `docs/testing/test-plan-template.md`.
