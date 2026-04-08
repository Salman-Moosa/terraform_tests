resource "aws_key_pair" "demo_key" {
  public_key = file("~/.ssh/demo.pub")
  key_name = var.key_name
  
}
resource "aws_instance" "demo_ec2" {
  
  for_each = var.instances
  
  ami = each.value.ami
  instance_type = each.value.instance_type
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name = aws_key_pair.demo_key.key_name

  tags = {
    Name ="demo_ec2"
  }
  
}