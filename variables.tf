variable "component" {}
variable "vpc_id" {}
variable "env" {}
variable "max_size" {}
variable "min_size" {}
variable "instance_profile_name" {}
variable "instance_type" {}
variable "port" {}
variable "sg_subnet_cidr" {}
variable "tags" {
  default = {}
}
variable "desired_capacity" {}