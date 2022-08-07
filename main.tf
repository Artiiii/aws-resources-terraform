terraform {

required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  alias  = "usw2"
  region = "us-west-2"
}

module "ec2" {
  source    = "./ec2"
  providers = {
    aws = aws.usw2
  }
}

module "dynamodb" {
  source    = "./dynamodb"
  providers = {
   aws = aws.usw2
  }
}
