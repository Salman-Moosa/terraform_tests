variable "vpc_id" {
  type = string
  description = "vpc id"

}
variable "public_subnet_id" {
  type = string
  description = "public subnet id "
}

variable "default_ami" {
  type        = string
  default     = "ami-01a1b1a4d93797ddc"
}


variable "default_instance_type" {
  description  ="dev instance type"
  type=string
  default     = "t2.micro"

}

variable "security_group_id" {
  type = string
  description = "describe your variable"
}