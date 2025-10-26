# LLMSecOps Workshop

This repository contains a **FastAPI** demo application for the LLMSecOps Workshop.  
It demonstrates a complete **DevSecOps CI/CD pipeline** that builds, scans and deploys a Dockerized application securely using **GitHub Actions**.

---

## CI/CD Workflow Overview

The GitHub Actions workflow (`.github/workflows/ci.yml`) automates the following stages:

### 1 Build & Push to Docker Hub
- Builds the FastAPI app into a Docker image ('fastapi-app').
- Logs in to Docker Hub using repository secrets.
- Pushes the image to your Docker Hub repository with two tags:
  - 'latest'
  - Commit SHA (for version traceability).

### 2 Trivy Vulnerability Scan (SecOps)
- Scans the pushed image on Docker Hub using [Aqua Security's Trivy](https://github.com/aquasecurity/trivy-action).
- Detects **HIGH** and **CRITICAL** severity vulnerabilities.
- Generates a **SARIF report** ('trivy-results.sarif') for code scanning results.
- Uploads the findings to **GitHub Security > Code Scanning Alerts**.

### 3 Verify Container Deployment
- Runs the pushed image in a container.
- Confirms the container starts successfully and is accessible on port '8000'.

---

## 📦 Run Locally

To test the application manually:

'''bash
# Build and run locally
docker build -t fastapi-app .
docker run -p 8000:8000 fastapi-app





---
# PRACTICE # For Own Reference # Please Ignore

# Docker Build and Run
1. docker build -t fastapi-app .
2. docker run -p 8000:8000 fastapi-app

# Trivy Scanning Docker Image for Vulnerability
1. docker pull aquasec/trivy:latest
2. docker images
3. docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --scanners vuln --timeout 10m --severity HIGH,CRITICAL fastapi-app
3a. docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --timeout 10m fastapi-app


# Tag and Push Docker Image to ECR
1. Login to amazon aws console
2. Search "ECR"
3. Create a new repository

1. https://console.aws.amazon.com/iam/home#/security_credentials
2. Create Access Key


# Google Search to get the codes
1. push to docker hub github actions
2. trivy github actions
