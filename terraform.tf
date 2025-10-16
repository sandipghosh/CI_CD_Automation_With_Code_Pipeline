terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.15.0"
    }
  }

  backend "s3" {
    bucket = "terraform-remote-state-sandip-new"
    key    = "aws-code-pipeline/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}
