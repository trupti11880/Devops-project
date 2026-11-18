# app.py
from flask import Flask, jsonify
from dotenv import load_dotenv
import os

load_dotenv()
app = Flask(__name__)

APP_NAME = os.getenv("APP_NAME", "DevOps Demo")


@app.route("/")
def home():
    return jsonify({
        "message": "Welcome to DevOps Project! Check the health and status endpoints.",
        "application": APP_NAME
    })


@app.route("/health")
def health():
    return jsonify({"status": "healthy"})


@app.route("/status")
def status():
    return jsonify({
        "application": APP_NAME,
        "status": "running"
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)