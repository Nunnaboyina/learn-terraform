# Basic Provider configuration
# To establish Terraform AWS provider configuration, we have to declare provider in the configuration

terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 6.70.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
}