from flask import Flask
from flask import request, jsonify
import json
app = Flask(__name__)

@app.route("/actions/")
def hello_world():
        data =  json.load(open("./mysite/actions.json"))
        print(data)
        return data
@app.route('/actions/post', methods=[ 'POST'])
def question():
        if request.method == 'POST':
            data = (request.json)
            json.dump(data,open("./mysite/actions.json",'w'))
            print(data)
            return data
@app.route("/test/actions/")
def hello_worldt():
        data =  json.load(open("./mysite/test_actions.json"))
        print(data)
        return data
@app.route('/test/actions/post', methods=[ 'POST'])
def questiont():
        if request.method == 'POST':
            data = (request.json)
            json.dump(data,open("./mysite/test_actions.json",'w'))
            print(data)
            return data
@app.route("/users/")
def hello_world2():
        data =  json.load(open("./mysite/users.json"))
        print(data)
        return data
@app.route('/users/post', methods=[ 'POST'])
def question2():
        if request.method == 'POST':
            data = (request.json)
            json.dump(data,open("./mysite/users.json",'w'))
            print(data)
            return data