
variable "default_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default   = "us-west-1"
}

variable "default_instance_type" {
  description  ="dev instance type"
  type=string
  default     = "t2.micro"

}

variable "default_ami" {
  type        = string
  default     = "ami-01a1b1a4d93797ddc"
}