terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "terraform-practice"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "PerformacePercentage"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "Topic"
    type = "S"
  }

  attribute {
    name = "PerformacePercentage"
    type = "N"
  }
  

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "TopicIndex"
    hash_key           = "Topic"
    range_key          = "PerformacePercentage"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
