import requests, json
import simplejson
url = "https://devopsmar12019.atlassian.net/rest/api/2/issue/QUIC-5/transitions?expand=transitions.fields"
headers = {'Content-type': 'application/json', 'Accept': 'application/json'}
data = {
    'username': 'devops.mar1.2019@gmail.com',
    'password': 'wlhokM24ZGIjjYwNXxKXDC67'
}
data1 = {"update": {"comment": [{"add": {"body": "Comment added when resolving issue"}}]},"transition": {"id": "21"}}
r = requests.post(url, auth=('devops.mar1.2019@gmail.com', 'wlhokM24ZGIjjYwNXxKXDC67'), data=json.dumps(data1), headers=headers)
try:
  print(r)
  data = r.json()
  print(data)
except simplejson.errors.JSONDecodeError:
    print("N'est pas JSON")
