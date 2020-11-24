from flask import Flask
from flask import request
import json

app = Flask(__name__)

@app.route("/",  methods = ['POST'])
def hello():
    print(request.get_json())
    return json.dumps({'success':True}), 200, {'ContentType':'application/json'} 

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
