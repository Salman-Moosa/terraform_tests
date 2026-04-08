data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name= "demo-vpc"
  }
}
resource "aws_subnet" "Public" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true  
}


resource "aws_subnet" "Private_1" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = var.private_1_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
    
}
resource "aws_subnet" "Private_2" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = var.private_2_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
    
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
resource "aws_route_table_association" "private_1" {
  route_table_id =  aws_route_table.private_route.id
  subnet_id = aws_subnet.Private_1.id
  
}
resource "aws_route_table_association" "private_2" {
  route_table_id =  aws_route_table.private_route.id
  subnet_id = aws_subnet.Private_2.id
  
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