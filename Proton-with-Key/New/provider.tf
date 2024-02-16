terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# CONFIGURE the AWS Provider

provider "aws" {
  region = var.region
}