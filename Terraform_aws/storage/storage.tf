terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "test_demo_bucket" {
  bucket = "my-testing-sample-demo-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}