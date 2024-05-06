provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
terraform {  
backend "s3" {
    bucket         = "this-is-my-official-bucket"
    key            = "NYB/terraform_assignment/default.tfstate"
    encrypt        = true
    region         = "us-east-1"
    dynamodb_table = "tf-state-lock-with-dynamodb"
  }
}
