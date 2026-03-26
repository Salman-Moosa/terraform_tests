
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
module "ec2-module" {
  source = "./modules/ec2"
  vpc_id = module.vpc_module.vpc_id
  security_group_id = module.vpc_module.security_group_id
  public_subnet_id = module.vpc_module.public_subnet_id
  default_ami= var.default_ami
  default_instance_type = var.default_instance_type
 
}

output "ec2_public_ip" {
  value = module.ec2_module.ec2_public_ip
}