data "aws_ami" "centos8_joindevops" {
  most_recent = true
  owners = ["973714476881"]

  filter {
    name = "name"
    values = ["Centos-8-DevOps-Practice"]
  }
}