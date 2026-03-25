output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}

output "public_subnet_id"{
    value =aws_subnet.Public.id
}

output "security_group_id" {
  value = aws_security_group.demo_sg.id
}
output "ec2_public_ip" {
  value = aws_instance.demo_ec2.public_ip
}