from flask import Flask, request, jsonify
import json, requests
import simplejson

app = Flask(__name__)
def update_jira_status(jiraid):
    url = f"https://devopsmar12019.atlassian.net/rest/api/2/issue/{jiraid}/transitions?expand=transitions.fields"
    headers = {'Content-type': 'application/json', 'Accept': 'application/json'}
    data1 = {"update": {"comment": [{"add": {"body": "Comment added when resolving issue"}}]},"transition": {"id": "31"}}
    r = requests.post(url, auth=('devops.mar1.2019@gmail.com', 'wlhokM24ZGIjjYwNXxKXDC67'), data=json.dumps(data1), headers=headers)
    print(r)
    return "OK"
@app.route('/foo', methods=['POST']) 
def foo():
    data = request.json
    msg = data['head_commit']['message']
    jiraid = msg.split(":")[0]
    print(jiraid)
    result = update_jira_status(jiraid)
    print(result)
    return jsonify(result)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
