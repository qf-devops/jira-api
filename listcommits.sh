> commandResult 
condition=$(git log --oneline | head -n 1) 
if [[ $condition == *"pull request"* ]]; then 

arr=$(git log --oneline | grep 'pull request' | head -n 2 | awk '{print $1}') 

SAVEIFS=$IFS 
IFS=$'\n' 
arr=($arr) 
IFS=$SAVEIFS 

commits=$(git log --oneline ${arr[1]}..${arr[0]}) 
flag=0 
if [[ ! -z $commits ]]; then 
while IFS= read -r line; do 
if [ $flag == '0' ] 
then 
flag=1 
continue 1 
fi 
line=$(echo $line | cut -d' ' -f2-) 
if [[ $line == *":"* ]]; then 
jid=$(echo $line | awk -F ':' '{print $1}') 
jmessage=$(echo $line | awk -F ':' '{print $2}') 
echo "$jid:$jmessage" >> commandResult 
fi 
done <<< "$commits" 
fi 
fi
