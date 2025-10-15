# Stage 1: build - create a clean virtualenv with dependencies
FROM python:3.11-slim AS build

WORKDIR /app

# Install pip-tools and build dependencies in isolated venv
COPY requirements.txt requirements-dev.txt ./
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

# Stage 2: runtime
FROM python:3.11-slim

WORKDIR /app

COPY --from=build /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY requirements.txt ./
COPY app.py ./

EXPOSE 8000

CMD ["python", "app.py"]
