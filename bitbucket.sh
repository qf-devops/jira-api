BB_URL=https://api.bitbucket.org/2.0/repositories/devopsmar12019
PR_NUMBER_JUST_CREATED=5
curl $BB_URL/core/pullrequests/$PR_NUMBER_JUST_CREATED \
    | jq . > pr_get.json
cat pr_get.json|/usr/local/bin/jq -r '.description' > msg.txt

oldIFS="$IFS"
IFS=$'\n' arr=($(<msg.txt))
IFS="$oldIFS"
echo "${arr[1]}"
(IFS=','; for word in ${arr[1]}; do echo "$word"; done)
