resource "aws_instance" "TF-AWS-Instance-Creation" {
    ami = "ami-0f3c7d07486cad139"
    instance_type = "t2.micro"
    vpc_id = "vpc-0856fa180ad5941c7"

    tags = {

        Name = "AWS-EC2-Instance"
    }
}