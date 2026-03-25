output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}

output "public_subnet_id"{
    value =aws_subnet.Public.id
}