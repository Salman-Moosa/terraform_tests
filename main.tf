
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
  private_1_subnet_cidr= "10.0.2.0/24"
  private_2_subnet_cidr= "10.0.3.0/24"
  
}
module "ec2_module" {

  
  source = "./modules/ec2"
  instances = 1
  vpc_id = module.vpc_module.vpc_id
  security_group_id = module.vpc_module.security_group_id
  public_subnet_id = module.vpc_module.public_subnet_id
  key_name = "demo"
}



module "rds_module" {
  source = "./modules/rds"
  private_subnet_ids = ""
  vpc_id = ""
  db_password = "12345678"
  ec2_security_group_id = ""
}