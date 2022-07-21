variable "name" {
  type        = string
  description = "Name tag for the VPC"
  default = "vpc-jumia-apps"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/20", "10.0.32.0/20"]
  description = "CIDR block range for the private subnets"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.16.0/20", "10.0.48.0/20"]
  description = "CIDR block range for the public subnets"
}

variable "region" {
  type        = string
  description = "The AWS region where resources have been deployed"
  default = "eu-central-1"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for the selected region"
  default = [ "eu-central-1a","eu-central-1b" ]
}
