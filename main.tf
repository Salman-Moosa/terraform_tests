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
     region = "us-east-1"
}

resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name= "demo-vpc"
  }
}
resource "aws_subnet" "Public" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = "10.0.1.0/24" 
  map_public_ip_on_launch = true  
}
resource "aws_subnet" "Private" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = "10.0.2.0/24" 
    
}
resource "aws_internet_gateway" "demo_IGW" {
  vpc_id = aws_vpc.demo_vpc.id
  
}
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.demo_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
         gateway_id = aws_internet_gateway.demo_IGW.id
    }
  
}
resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.demo_vpc.id

    
  
}

resource "aws_route_table_association" "public" {
  route_table_id =  aws_route_table.public_route.id
  subnet_id = aws_subnet.Public.id
}
resource "aws_route_table_association" "private" {
  route_table_id =  aws_route_table.private_route.id
  subnet_id = aws_subnet.Private.id
  
}
resource "aws_security_group" "demo_sg" {
  vpc_id = aws_vpc.demo_vpc.id
  ingress {
    from_port = 22
    to_port = 22
    protocol ="tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress  {
    from_port = 0
    to_port =0
    protocol ="-1"
    cidr_blocks=["0.0.0.0/0"]
  }
  
}
resource "aws_key_pair" "demo_key" {
  public_key = file("~/.ssh/demo.pub")
  key_name = "demo"
  
}
resource "aws_instance" "demo_ec2" {
  ami = "ami-01a1b1a4d93797ddc"
  
  instance_type = "t2.micro"
  subnet_id = aws_subnet.Public.id
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name = aws_key_pair.demo_key.key_name

  tags = {
    Name ="demo_ec2"
  }
  
}

output "ec2_public_ip" {
  value = aws_instance.demo_ec2.public_ip
}









