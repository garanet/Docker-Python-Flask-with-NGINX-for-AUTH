# A Docker Python-Flask with NGINX for the AUTH project
# @maintainer G.Gatto 2021 - www.garanet.net
# repo from: https://github.com/garanet/Docker-Python-Flask-with-NGINX-for-AUTH
# Tested on a MacOsx with Docker + Kuberneters (Docker-Desktop)

from flask import Flask, request
from flask_httpauth import HTTPBasicAuth
from werkzeug.security import generate_password_hash
from werkzeug.security import check_password_hash

# Basic Auth APP
auth = HTTPBasicAuth()
@auth.verify_password
def verify_password(username, password):
    if username in users:
        return check_password_hash(users.get(username), password)
    return False

# Change the below value
user = 'admin'
pw = 'test'
users = {
    user: generate_password_hash(pw)
}
# End Basic Auth function 
# Uncomment the '@auth.login_required' if you need a basic auth from flask.

# APP
app = Flask(__name__)

@app.route('/garanet')
# @auth.login_required
def garanet():
    return 'Success'

@app.route('/world')
# @auth.login_required
def rest_world():
    return '{"id":0,"message":"Success"}'

@app.route('/getmyfile', methods=['POST'])
# @auth.login_required
def getmyfile():
    request_data = request.get_json()
    a_value = request_data["key"]
    return "JSON value sent: " + a_value

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port="5000")