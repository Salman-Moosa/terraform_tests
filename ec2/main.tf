resource "aws_key_pair" "demo_key" {
  public_key = file("~/.ssh/demo.pub")
  key_name = "demo"
  
}
resource "aws_instance" "demo_ec2" {
  ami = var.default_ami
  
  instance_type = var.default_instance_type
  subnet_id = aws_subnet.Public.id
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name = aws_key_pair.demo_key.key_name

  tags = {
    Name ="demo_ec2"
  }
  
}