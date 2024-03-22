resource "aws_instance" "TF-AWS-Instance" {
    ami = data.aws_ami.centos8.id
    instance_type = lookup(var.instance_type, terraform.workspace)

    tags = {
    Name = "workspace"
  }
}