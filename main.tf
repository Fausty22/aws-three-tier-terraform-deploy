terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# VPC Module
module "vpc" {
  source               = "./modules/vpc"
  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

# IAM Module
module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
  environment  = var.environment
}

# EKS Module
module "eks" {
  source                 = "./modules/eks"
  project_name           = var.project_name
  environment            = var.environment
  eks_cluster_version    = var.eks_cluster_version
  eks_node_instance_type = var.eks_node_instance_type
  eks_desired_nodes      = var.eks_desired_nodes
  eks_min_nodes          = var.eks_min_nodes
  eks_max_nodes          = var.eks_max_nodes
  private_subnet_ids     = module.vpc.private_subnet_ids
  vpc_id                 = module.vpc.vpc_id
  eks_cluster_role_arn   = module.iam.eks_cluster_role_arn
  eks_node_role_arn      = module.iam.eks_node_role_arn
}

# RDS Module
module "rds" {
  source             = "./modules/rds"
  project_name       = var.project_name
  environment        = var.environment
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
  db_instance_class  = var.db_instance_class
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
  eks_sg_id          = module.eks.eks_cluster_sg_id
}