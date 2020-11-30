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
  echo $rawjid | awk -F ':' '{print $1}'
  echo $rawjid | awk -F ':' '{print $2}'
fi
done
