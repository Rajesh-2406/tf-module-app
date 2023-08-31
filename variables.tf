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
variable "allow_ssh_cidr" {}
variable "lb_dns_name" {}
variable "listener_arn" {}
variable "lb_rule_priority" {}
variable "allow_prometheus_cidr" {}
variable "kms_arn" {}
