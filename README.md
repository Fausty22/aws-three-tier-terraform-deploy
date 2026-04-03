# AWS Three-Tier Banking App Infrastructure

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)
![Kubernetes](https://img.shields.io/badge/Orchestration-Kubernetes-blue)
![CI/CD](https://img.shields.io/badge/CI/CD-GitHub_Actions-green)

## Overview
Production-grade three-tier banking application infrastructure deployed on AWS using modern DevOps practices. Built as part of a Cloud & DevOps portfolio project.

## Architecture
- **VPC** — Multi-AZ network with public and private subnets
- **EKS** — Kubernetes cluster running on private subnets
- **RDS MySQL** — Managed database on isolated private subnets
- **NAT Gateway** — Secure outbound internet access for private resources
- **Load Balancer** — Public-facing traffic distribution
- **IAM** — Least-privilege roles for all services

## Tools & Technologies
| Category | Tool |
|---|---|
| Cloud Provider | AWS |
| Infrastructure as Code | Terraform |
| Container Orchestration | Kubernetes (EKS) |
| CI/CD Pipeline | GitHub Actions |
| GitOps | Argo CD |
| Container Registry | Amazon ECR |
| Database | Amazon RDS MySQL |
| Security | IAM, Security Groups, GitHub Secrets |

## Infrastructure Modules
modules/
├── vpc/        # VPC, subnets, routing, NAT Gateway
├── eks/        # EKS cluster and node groups
├── rds/        # RDS MySQL database
└── iam/        # IAM roles and policies

## CI/CD Pipeline
Every push to main branch automatically:
1. Initializes Terraform
2. Validates configuration
3. Plans infrastructure changes
4. Applies changes to AWS

## How to Deploy
```bash
# Clone the repository
git clone https://github.com/Fausty22/aws-three-tier-terraform-deploy.git

# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Deploy
terraform apply
```

## Author
**Faustina Nwokolo** — Cloud & DevOps Engineer
- GitHub: [@Fausty22](https://github.com/Fausty22)