variable "load_balancer_type" {
  type = string
}

variable "subnets" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}
variable "bucket" {
  type = string
}
variable "target_id" {
  type = string
}
variable "certificate_arn" {
  type = string
}

variable "name" {
  type = string
}