terraform {
  required_version = "~> 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.6"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.4.5"
    }
  }

  backend "s3" {
    bucket         = var.backend_s3_bucket_name
    key            = var.backend_s3_key
    region         = var.backend_aws_region
    dynamodb_table = var.backend_dynamodb_table
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_provider_region

  default_tags {
    tags = {
      Project = var.default_project_tag
    }
  }
}