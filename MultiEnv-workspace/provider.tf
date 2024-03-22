terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }

    backend "s3" {
        bucket = "multi-env-workspace"
        key    = "workspace"
        region = "us-east-1"
        dynamodb_table = "multi-env-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}