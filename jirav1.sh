#!/usr/bin/env bash

update_status(){
JIRA_USER="${1}"
JIRA_PASS="${2}"
JIRA_NO="${3}"
TRANSID="${5}"
MESSAGE="${4}"
echo " params:  $MESSAGE  $JIRA_NO    $TRANSID"
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
if [ $br == "release" ]; then
    TRANSID="21"
elif [ $br == "master" ]; then
    TRANSID="31"
else
   TRANSID="21"
fi
echo "$prid  $br $TRANSID"
commits=$(curl -X GET -u 'devops.july2.2017@gmail.com': 92176f1fa9deb9fb4de1d6c11d30c492a5f7145e https://api.github.com/repos/quickfixtech/jira-api/pulls/$prid/commits)
echo "$commits">file.json
#jq -r '.commit' file.json
/usr/bin/jq -c '.[]' file.json | while read i; do
#     do stuff with $i
rawjid=$(echo $i | /usr/bin/jq -r '.commit.message')
if [[ $rawjid == *":"* ]]; then
  jid=$(echo $rawjid | awk -F ':' '{print $1}')
  jmessage=$(echo $rawjid | awk -F ':' '{print $2}')
  update_status "$JIRA_USER" "$JIRA_PASS" "$jid" "$jmessage" "$TRANSID"
fi
done
