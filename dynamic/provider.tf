terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.36.0"
    }
  }

  backend "s3" {
    bucket = "temp-bucket-delete-later"
    key    = "simple_delete_later-1"
    region = "us-east-1"
    dynamodb_table = "Temp-lock-delete-later"
  }
}

provider "aws" {
    region = "us-east-1"
}