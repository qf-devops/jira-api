#!/usr/bin/env bash

update_status(){
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
                    "body": "'"${MESSAGE}"'"
                }
            }
        ]
    },
    "transition": {
        "id": "'"${TRANSID}"'"
    }
}'
}
JIRA_USER="${1}"
JIRA_PASS="${2}"
a=$(git log -1 --pretty=%B|head -1)
y=$(echo $a | awk '{print $4}')
z=$(echo $a | awk '{print $6}')
prid=$(echo ${y//#})
br=$(echo $z | awk -F '/' '{print $2}')
commits=$(curl -X GET -u 'devops.july2.2017@gmail.com':279a86e8173a7ac5f4fa8aa9d2f3dc12d6ef75f5 https://api.github.com/repos/quickfixtech/jira-api/pulls/3/commits)
echo "$commits">file.json
#jq -r '.commit' file.json
jq -c '.[]' file.json | while read i; do
#     do stuff with $i
rawjid=$(echo $i | jq -r '.commit.message')
if [[ $rawjid == *":"* ]]; then
  jid=$(echo $rawjid | awk -F ':' '{print $1}')
  jmessage=$(echo $rawjid | awk -F ':' '{print $2}')
  update_status $JIRA_USER $JIRA_PASS $jid $jmessage
fi
done
