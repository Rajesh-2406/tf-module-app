data "aws_ami" "ami" {
  owners      = ["765371225572"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}