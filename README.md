# Production-Style DevSecOps CI/CD Pipeline on AWS EKS

A hands-on DevSecOps portfolio project demonstrating an end-to-end software delivery workflow using GitHub, Jenkins, Docker, Trivy, DockerHub, Kubernetes, Amazon EKS, Terraform and Ansible.

## Project Objective

The objective of this project is to demonstrate how application source code can move through an automated DevSecOps pipeline:

```text
Developer
    ↓
GitHub
    ↓
Jenkins
    ↓
Automated Testing
    ↓
Docker Build
    ↓
Trivy Security Scan
    ↓
DockerHub
    ↓
Amazon EKS
    ↓
Kubernetes Deployment
    ↓
Application

## Technologies

- Git & GitHub
- Python & Flask
- Jenkins
- Docker
- DockerHub
- Kubernetes
- Amazon EKS
- AWS
- Terraform
- Ansible
- Trivy
- Linux
- Bash
- Pytest

## Key DevSecOps Features

- Automated CI/CD pipeline using Jenkins
- Automated application testing with Pytest
- Docker containerization
- Container vulnerability scanning with Trivy
- Versioned Docker images
- DockerHub image publishing
- Kubernetes Deployment with rolling updates
- Kubernetes health checks
- Horizontal Pod Autoscaling
- AWS infrastructure defined using Terraform
- Linux server configuration using Ansible
- Bash-based operational scripts
- Non-root Docker container
- Kubernetes security context

## Project Structure

```text
app/
├── app.py
├── requirements.txt
└── tests/
    └── test_app.py

docker/
└── Dockerfile

k8s/
├── namespace.yaml
├── configmap.yaml
├── deployment.yaml
├── service.yaml
├── hpa.yaml
└── ingress.yaml

terraform/
├── providers.tf
├── variables.tf
├── outputs.tf
├── vpc.tf
├── iam.tf
├── eks.tf
└── terraform.tfvars.example

ansible/
├── inventory
├── playbook.yml
└── roles/
    └── docker/
        └── tasks/
            └── main.yml

scripts/
├── health-check.sh
└── cleanup.sh

Jenkinsfile
.gitignore
README.md
