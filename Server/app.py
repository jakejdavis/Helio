import dataset
from flask import Flask, request
from flask_cors import CORS, cross_origin
import json
import random
import string

app = Flask(__name__)
CORS(app)


#db = dataset.connect('sqlite:///database.db')
db = dataset.connect('postgres://fimakatjeygazu:PvZxVsgu13bdgShJHKn8ufzjO3@ec2-54-247-121-238.eu-west-1.compute.amazonaws.com:5432/dbcnaabb6pvao6')
t_users = db['users']
t_messages = db['messages']

def make_token():
    token=''
    for x in range(16):
        rand = random.choice([1,2,3])
        if rand == 1:
            token += token.join(random.choice(string.ascii_uppercase))
        elif rand == 2:
            token += token.join(random.choice(string.ascii_lowercase))
        else:
            token += token.join(random.choice(string.digits))
    return token


@app.route("/")
def root():
    return json.dumps({"response": 200})


@app.route("/register")
def register():
    global t_users
    global http_codes
    if t_users.find_one(username=request.args.get('username')) == None:
        try:
            t_users.insert(dict(username=request.args.get('username'), 
                                password=request.args.get('password')))
            return json.dumps({"response": 200})
        except Exception:
            return json.dumps({"response": 500})
    else:
        return json.dumps({"response": 409})


@app.route("/login")
def login():
    global t_users
    global http_codes
    try:
        user = t_users.find_one(username=request.args.get('username'))
        if user == None:
            return json.dumps({"response": 401})
        else:
            if user['password'] == request.args.get('password'):
                tok = make_token()
                token = dict(username=request.args.get('username'), token=tok)
                t_users.update(token, ['username'])
                return json.dumps({"response": 200, "token": tok})
            else:
                return json.dumps({"response": 401})
    except Exception:
        return json.dumps({"response": 500})
            
            
@app.route("/get_data")
def get_data():
    messages = []
    score = 0
    user = t_users.find_one(username=request.args.get('username'))
    lastId = request.args.get('lastId')
    if request.args.get('token') == user['token']:
        for message in db['messages'].find(channel=request.args.get('channel')):
            if message["id"] > int(lastId if lastId is not None else "0"):
                messages.append({"id": message["id"], "content": message["content"], "author": message["author"]})
        for message in db['messages'].find(author=request.args.get('username')):
            score = score + 0.5
        token = "good"
    else:
        token = "bad"
    return json.dumps(dict(token=token, messages=messages, score=str(int(round(score)))))
    
    
@app.route("/snd_msg")
def snd_msg():
	db['messages'].insert(dict(content=request.args.get('content'),
								author=request.args.get('author'),
								channel=request.args.get('channel')))
	return "200"
    

if __name__ == "__main__":
    context = ("server.crt", "domain.key")
    app.run('0.0.0.0', debug=True, port=5000) #, ssl_context=context)

