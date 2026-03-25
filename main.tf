
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws"{
     region = var.default_region
}

module "vpc_module" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidr="10.0.1.0/24"
  private_subnet_cidr= "10.0.2.0/24"
  
}










