locals {
  environment = "prod"
  region      = "ca-central-1"
  project     = "esta-mcn"
}

terraform {
  backend "s3" {
    bucket = "esta-mcn-terraform-state"
    key    = "state/terraform_prod.tfstate"
    region = "ca-central-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = local.region
  default_tags {
    tags = {
      Environment = local.environment
      Terraform   = "true"
      Project     = local.project
    }
  }
}
