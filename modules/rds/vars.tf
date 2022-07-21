variable "db_engine" {
  type        = string
  description = "Type of Database Engine"
}

variable "db_engine_version" {
  type        = number
  description = "Engine Version"
}

variable "instance_class" {
  type = string
}

variable "db_subnet_group_name" {
  type = string
}

variable "db_security_groups" {
  type = list(any)
}

variable "db_name" {
  type        = string
  description = "Name of Database"
}

variable "master_username" {
  type        = string
  description = "Username Database"
}

variable "master_password" {
  type = string
}

variable "identifier" {
  type = string
}
