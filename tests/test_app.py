from app import app

def test_health():
    client = app.test_client()
    r = client.get("/health")
    assert r.status_code == 200
    assert r.get_json()["status"] == "ok"

def test_root():
    client = app.test_client()
    r = client.get("/")
    assert r.status_code == 200
    assert "Hello from Python CI/CD!" in r.get_json().get("message", "")
