from flask import Flask, jsonify
import os

app = Flask(__name__)

APP_NAME = os.getenv("APP_NAME", "DevSecOps Employee Portal")
APP_VERSION = os.getenv("APP_VERSION", "1.0.0")
APP_ENVIRONMENT = os.getenv("APP_ENVIRONMENT", "development")
PORT = int(os.getenv("PORT", "5000"))


@app.route("/")
def home():
    return jsonify(
        {
            "application": APP_NAME,
            "version": APP_VERSION,
            "environment": APP_ENVIRONMENT,
            "status": "running"
        }
    )


@app.route("/health")
def health():
    return jsonify(
        {
            "status": "healthy"
        }
    )


@app.route("/version")
def version():
    return jsonify(
        {
            "application": APP_NAME,
            "version": APP_VERSION
        }
    )


@app.route("/api/employees")
def employees():
    return jsonify(
        {
            "employees": [
                {
                    "id": 1,
                    "name": "Shashank",
                    "role": "DevOps Engineer"
                },
                {
                    "id": 2,
                    "name": "Aarav",
                    "role": "Cloud Engineer"
                },
                {
                    "id": 3,
                    "name": "Rahul",
                    "role": "Platform Engineer"
                }
            ]
        }
    )


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=PORT
    )
