curl --request POST \
  --url 'https://devopsmar12019.atlassian.net/rest/api/3/issue' \
  --user 'devops.mar1.2019@gmail.com:wlhokM24ZGIjjYwNXxKXDC67' \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
  "fields": {
    "project": {
      "key": "QUIC"
    },
    "summary": "Sample issue summary",
    "issuetype": {
      "name": "Task"
    },
    "description": {
      "type": "doc",
      "version": 1,
      "content": [
        {
          "type": "paragraph",
          "content": [
            {
              "text": "description",
              "type": "text"
            }
          ]
        }
      ]
    }
  }
}'
