# ShipIt-49: Automation of Slack User Mentions

[**ShipIt Ticket**](https://shipit.atlassian.net/browse/SHPXLIX-317)

### What is this repository for?
[**_Automation_**](https://docs.automationforjira.com/rule-playground/index.html#/) does great stuff, including Slack messages that can be formatted well. But one area that users ask questions on Community quite a bit about is @mentioning people in Slack messages, and there's not a straightforward way of dynamically doing that with Automation.

This project will allow an admin user (who can update properties of all JIRA users in an instance) to:

- Connect to Slack's API and get a list of users (Slack UID and email address)
- Connect to Jira Cloud's API and get a list of user's with matching email addresses
- Upload the matched Slack UIDs/Username as a user property in Jira (under `metadata.value.slack_id` and `metadata.value.slack_username` respectively)

Then it's a simple matter of using a smart value in **_Automation_** to `@mention` a Slack user.

### How do I get set up?

#### Pre-requisites:

The script syncs slack IDs with JIRA workspace, so you'll need:

- Slack token (minimally with scopes [`users:read`](https://api.slack.com/scopes/users:read) and [`users:read:email`](https://api.slack.com/scopes/users:read.email)) to read user lists
    - If you don't have one, you'll need to create a new app and use Slack's [OAuth](https://api.slack.com/authentication/oauth-v2) to authenticate and generate a token.
- JIRA instance:
    - Server URL
    - User ID (The user should have [`Administer Jira`](https://confluence.atlassian.com/adminjiracloud/managing-global-permissions-776636359.html) global permission to enable updating property)
    - [Associated API token](https://id.atlassian.com/manage/api-tokens)
- Python >= 3.6
- `pip` (Python's package manager)

#### Installation:
- This project is a standalone python 3 script (tested with Python 3.8, but should work with >= 3.6) and uses a single 
extra library [`slackclient`](https://github.com/slackapi/python-slackclient) which is the official Python client for slack.

```bash
cd slack_jira_sync # Move to project directory
pip3 install slackclient
```

#### Usage:

```bash
python3 sync.py --slack_token $SLACK_TOKEN --jira_url $JIRA_URL --username $USERNAME --apikey $APIKEY
python3 sync.py -h # For Help
```

#### Note:

You can tweak the following configuration values in the `sync.py` script:
```python
# Use a different log level (log.DEBUG/log.WARN)
import logging as log
log.basicConfig(level=log.INFO)

# Pagination limit for Slack 'list_users'
SLACK_PAGINATION_LIMIT = 30

# Delay in between API calls in ms (because we're making multiple requests, and do not want to exceed rate limits)
API_DELAY_MS = 500
```

Additionally, you can use the script's `get_slack_info(account_id)` to obtain slack username, ID for user account from user 
properties:

```python3
# Import script in workspace
import sync

jira_url, username, apikey = '<URL>', '<USERNAME>', '<APIKEY>'
jira = JIRA(jira_url, username, apikey)
slack_id, slack_username = jira.get_slack_info('<account_id>')
```

### Who do I talk to? ###

* Slack: `#shipit49-automation-slack`, `@saurav`, `@deads`