from flask import Flask, request, jsonify
from flask import Flask
import json, requests
import simplejson

app = Flask(__name__)
def status_update():
  url = "https://devopsmar12019.atlassian.net/rest/api/2/issue/QUIC-5/transitions?expand=transitions.fields"
  headers = {'Content-type': 'application/json', 'Accept': 'application/json'}
  data1 = {"update": {"comment": [{"add": {"body": "Comment added when resolving issue"}}]},"transition": {"id": "31"}}
  r = requests.post(url, auth=('devops.mar1.2019@gmail.com', 'wlhokM24ZGIjjYwNXxKXDC67'), data=json.dumps(data1), headers=headers)
  try:
    print(r)
    data = r.json()
    print(data)
  except simplejson.errors.JSONDecodeError:
    print("N'est pas JSON")

@app.route("/",  methods = ['POST'])
def hello():
    status_update()

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
