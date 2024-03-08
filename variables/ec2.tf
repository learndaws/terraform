resource "aws_instance" "TF-AWS-Instance" {
  ami           = var.ami_id
  instance_type = var.instance_test
  vpc_security_group_ids = [aws_security_group.Security-Group.id]

  tags = {
    Name = "ec2-13-Feb-2024"
  }
}