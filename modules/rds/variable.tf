variable "private_subnet_ids" {
  type = list(string)

}

variable "vpc_id" {
    type = string
  
}

variable "db_password" {
    sensitive = true
    type = string
}

variable "ec2_security_group_id" {
  type = string
}

variable "db_engine" {
    default = "mysql"
    type = string
}

variable "db_engine_version" {
    default = "8.0"
    type = string
  
}
variable "db_instance_class" {
    default = "db.t3.micro"
    type = string
  
}
variable "multi_az" {
    type = bool
    default = false
  
}
variable "db_name" {
    type = string
    default = "default_db"
}
variable "db_username" {
  type = string
  default = "username"
}
