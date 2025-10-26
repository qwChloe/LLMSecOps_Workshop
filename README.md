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
