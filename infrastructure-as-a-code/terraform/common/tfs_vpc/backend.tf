# Setup remote state
terraform {
  required_version = "=0.14.8"
  backend "s3" {
    bucket         = "tech-challenge-terraform-states"
    key            = "common-tfs-vpc.tf"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = "true"
  }
}

