a=$(git log -1 --pretty=%B|head -1)
y=$(echo $a | awk '{print $4}')
z=$(echo $a | awk '{print $6}')
prid=$(echo ${y//#})
br=$(echo $z | awk -F '/' '{print $2}')
commits=$(curl -X GET https://bitbucket.org/api/2.0/repositories/devopsmar12019/core/pullrequests/2)
echo "$commits">file.json
jq -r '.description' file.json
