# CI-CD-and-Cloud-Automation-Project

This project implements a complete DevOps infrastructure setup using Terraform, including Jenkins CI/CD server, SonarQube for code quality analysis, and a monitoring stack with Prometheus and Grafana.

<img width="1408" height="768" alt="Gemini_Generated_Image_9t8klq9t8klq9t8k" src="https://github.com/user-attachments/assets/3ca7577b-4c04-43d9-8dd1-0bb15483c60a" />

## 🏗️ Architecture Overview

The project consists of three main components:

### 1. Jenkins/SonarQube Server
- EC2 Instance (t2.large)
- Jenkins CI server
- Containerized SonarQube
- Trivy scanner
- Ports: 8080 (Jenkins), 9000 (SonarQube), 22 (SSH), 80/443 (HTTP/HTTPS)

### 2. Monitoring Server
- EC2 Instance (t2.medium)
- Prometheus
- Node Exporter
- Grafana
- Ports: 9090 (Prometheus), 9100 (Node Exporter), 3000 (Grafana), 22 (SSH)

### 3. Containerized Application (EKS)
- Dockerized application
- Kubernetes deployment configuration
- EKS-ready setup
- Environment configuration
- Kubernetes service definitions

## 🚀 Prerequisites

- AWS Account with appropriate permissions
- Terraform >= 1.0.0
- AWS CLI configured
- Docker (for SonarQube container and monitoring tools and our application.)

## 📦 Project Structure

```
.
├── Jenkins-SonarQube-VM/
│   ├── main.tf           # Main Terraform configuration
│   ├── variables.tf      # Variable definitions
│   ├── provider.tf       # AWS provider configuration
│   └── install.sh        # Installation script
├── Monitoring-Server/
│   ├── main.tf           # Monitoring infrastructure
│   ├── variables.tf      # Variable definitions
│   ├── provider.tf       # AWS provider configuration
│   └── install.sh        # Monitoring tools installation
├── Dockerizing-Kubernetes-EKS/
│   ├── src/              # Application source code
│   ├── Kubernetes/       # Kubernetes configuration files
│   │   ├── deployment.yml
│   │   └── service.yml
│   ├── Dockerfile        # Container image definition
│   └── .env              # Environment configuration
└── README.md
```

## 🛠️ Setup Instructions

1. Clone the repository:
```bash
git clone <repository-url>
cd CI-CD-and-Cloud-Automation-Project
```

2. Jenkins/SonarQube Server Setup:
```bash
cd Jenkins-SonarQube-VM
terraform init
terraform plan
terraform apply
```

3. Monitoring Server Setup:
```bash
cd ../Monitoring-Server
terraform init
terraform plan
terraform apply
```

## 📝 Usage

### Accessing Services

After deployment, access the services:

1. Jenkins: `http://<jenkins-server-ip>:8080`
2. SonarQube: `http://<jenkins-server-ip>:9000`
3. Grafana: `http://<monitoring-server-ip>:3000`
4. Prometheus: `http://<monitoring-server-ip>:9090`

## 🔒 Security Notes

- All instances are configured with security groups
- SSH access is restricted
- HTTPS endpoints available for secure communication
- Regular security updates via automated scripts

## 🔧 Maintenance

### Infrastructure Updates
```bash
terraform plan
terraform apply
```

### System Updates
```bash
sudo apt update
sudo apt upgrade
```

## 🐛 Troubleshooting

Common issues and solutions:

1. Check service status:
```bash
sudo systemctl status jenkins
sudo systemctl status docker
sudo systemctl status prometheus
sudo systemctl status grafana-server
```

2. View logs:
```bash
sudo journalctl -u jenkins
docker logs sonarqube
sudo journalctl -u prometheus
```
