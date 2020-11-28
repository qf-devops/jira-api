curl --request POST \
  --url 'https://devopsmar12019.atlassian.net/rest/api/2/issue/QUIC-3/transitions?expand=transitions.fields' \
  --user 'devops.mar1.2019@gmail.com:wlhokM24ZGIjjYwNXxKXDC67' \
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
