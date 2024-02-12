resource "aws_instance" "TF-AWS-Instance-Creation" {
    ami = "ami-0f3c7d07486cad139"
    instance_type = "t2.micro"
    subnet_id = "subnet-07aa2a6b37659a333"

    tags = {

        Name = "AWS-EC2-Instance"
    }
}