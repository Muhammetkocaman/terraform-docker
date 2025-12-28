terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "muhammet-terraform-state-storage"
    key = "dev/docker-project.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-state-lock-db"
    encrypt = true 

  }
}

provider "aws" {
  region = var.region
}



module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "aws_security_group" {
  source = "./modules/security_group"

}
