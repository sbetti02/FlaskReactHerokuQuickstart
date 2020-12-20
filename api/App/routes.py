from flask import jsonify

from App import app

@app.route('/')
def index():
    return "Yo!"

@app.route('/api_test')
def api_test():
    return jsonify({'data': 'yes'})
