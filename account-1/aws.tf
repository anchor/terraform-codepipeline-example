data "aws_caller_identity" "current" {}
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project-Owner = var.project_owner
      Terraform     = "true"
    }
  }
}

