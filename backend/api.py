from flask import Flask
from flask import request, jsonify
import json
app = Flask(__name__)

@app.route("/actions/")
def hello_world():
        return json.load(open("actions.json"))
@app.route('/actions/post', methods=[ 'POST'])
def question():
        if request.method == 'POST':
            data = (request.json)
            json.dump(data,open("actions.json",'w'))
            return data
