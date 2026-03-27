output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}

output "public_subnet_id"{
    value =aws_subnet.Public.id
}

output "private_1_subnet_id"{
    value =aws_subnet.Private_1.id
}

output "private_2_subnet_id"{
    value =aws_subnet.Private_2.id
}

output "security_group_id" {
  value = aws_security_group.demo_sg.id
}