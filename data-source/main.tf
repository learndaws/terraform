data "aws_ami" "centos8" {
  most_recent = true
  owners = ["973714476881"]

  tags = {
    Name   = "Centos-8-DevOps-Practice"
  }
}

data "aws_vpc" "My_VPC" {
  default = true
}
