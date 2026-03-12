# variables.tf
# This file declares variables used in your Terraform configuration.
# You can specify type, description, and (optionally) a default value for each variable.

variable "default_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  # default   = "us-west-2" # Uncomment to set a default value
}
