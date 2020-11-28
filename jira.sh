#!/usr/bin/env bash
JIRA_USER="${1}"
JIRA_PASS="${2}"
JIRA_NO="QUIC-3"
TRANSID="21"
MESSAGE="Comment added when resolving issue"
curl --request POST \
  --url "https://devopsmar12019.atlassian.net/rest/api/2/issue/${JIRA_NO}/transitions?expand=transitions.fields" \
  --user "${JIRA_USER}:${JIRA_PASS}" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
    "update": {
        "comment": [
            {
                "add": {
                    "body": "$MESSAGE"
                }
            }
        ]
    },
    "transition": {
        "id": "$TRANSID"
    }
}'
