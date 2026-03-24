from flask import Flask,jsonify,request
from flask_cors import CORS
from dotenv import load_dotenv
import os
import sqlite3
import yaml
app = Flask(__name__)
CORS(app)

@app.route('/')
def hello():
    return jsonify("datum centre")

if __name__ == '__main__':
    app.run(debug=True)