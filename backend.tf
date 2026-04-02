terraform {
  backend "s3" {
    bucket = "faustina-terraform-state-2026"
    key    = "capstone/terraform.tfstate"
    region = "us-east-1"
  }
}