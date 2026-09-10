import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from app import app


def test_home_endpoint():
    client = app.test_client()

    response = client.get("/")

    assert response.status_code == 200

    data = response.get_json()

    assert data["application"] == "DevSecOps Employee Portal"
    assert data["status"] == "running"


def test_health_endpoint():
    client = app.test_client()

    response = client.get("/health")

    assert response.status_code == 200

    data = response.get_json()

    assert data["status"] == "healthy"


def test_version_endpoint():
    client = app.test_client()

    response = client.get("/version")

    assert response.status_code == 200

    data = response.get_json()

    assert "version" in data


def test_employees_endpoint():
    client = app.test_client()

    response = client.get("/api/employees")

    assert response.status_code == 200

    data = response.get_json()

    assert "employees" in data
    assert len(data["employees"]) == 3
