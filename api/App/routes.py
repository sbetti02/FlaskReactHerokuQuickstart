from flask import jsonify

from App import app

@app.route('/')
def index():
    return "Yo!"

@app.route('/healthcheck')
def healthcheck():
    return jsonify({'data': 'yes'})
