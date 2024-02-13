resource "aws_instance" "TF-AWS-Instance" {
    ami = var.ami_id
    instance_type = var.instance_type
}