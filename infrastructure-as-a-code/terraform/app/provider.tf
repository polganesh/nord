provider "aws" {
  allowed_account_ids = ["283117477011"]
  access_key          = var.aws-access-key
  secret_key          = var.aws-secret-key
  region              = var.region
}
