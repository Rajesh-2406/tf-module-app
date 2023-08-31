variable "component" {}
variable "vpc_id" {}
variable "env" {}
variable "max_size" {}
variable "min_size" {}
variable "instance_type" {}
variable "app_port" {}
variable "sg_subnet_cidr" {}
variable "tags" {
  default = {}
}
variable "desired_capacity" {}
variable "subnets" {}
variable "kms_key_id" {}