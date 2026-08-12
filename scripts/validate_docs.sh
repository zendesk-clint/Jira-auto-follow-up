#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "README.md"
  ".github/workflows/ci.yml"
  ".github/workflows/deploy.yml"
  "docs/architecture-template.md"
  "docs/runbook-template.md"
  "docs/security/mitre-attack-risk-register-template.md"
  "docs/testing/test-plan-template.md"
  "docs/testing/test-cases-template.md"
  "config/jira-query.example.jql"
  "config/slack-message.template.md"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "Missing required scaffold file: $file"
    exit 1
  fi
done

if ! rg -q "MITRE ATT&CK|ATT&CK" docs/security/mitre-attack-risk-register-template.md; then
  echo "Security template does not contain MITRE ATT&CK references."
  exit 1
fi

if ! rg -q "bi-weekly|two weeks" README.md; then
  echo "README does not state bi-weekly/two-week cadence."
  exit 1
fi

echo "Scaffold validation passed."
