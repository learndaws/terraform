resource "aws_instance" "TF-AWS-Instance" {
    ami = var.ami_id
    instance_type = (var.instance_name == "MongoDB" || var.instance_name == "dispatch" ? "t3.small" : "t2.micro")
}
