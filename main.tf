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



output "ec2_public_ip" {
  value = aws_instance.demo_ec2.public_ip
}









