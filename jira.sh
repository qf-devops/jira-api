#!/usr/bin/env bash
JIRA_USER="${1}"
JIRA_PASS="${2}"
curl --request POST \
  --url 'https://devopsmar12019.atlassian.net/rest/api/2/issue/QUIC-3/transitions?expand=transitions.fields' \
  --user '"${JIRA_USER}:${JIRA_PASS}"' \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
    "update": {
        "comment": [
            {
                "add": {
                    "body": "Comment added when resolving issue"
                }
            }
        ]
    },
    "transition": {
        "id": "21"
    }
}'
