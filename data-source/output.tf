output "centos8_joindevops" {
    value = data.aws_ami.centos8.id
}

output "My_VPC" {
    value = data.aws_vpc.My_VPC
}

