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
