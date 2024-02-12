resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Security-Group.id]

  tags = {
    Name = "ec2-12-Feb-2024"
  }
}

resource "aws_security_group" "Security-Group" {
  name        = var.SG_AWS_name
  description = var.SG_AWS_name
  # vpc_id      = aws_vpc.main.id

  ingress {
    description     = var.SG_ingress_AWS_name
    from_port        = var.Allow_all
    to_port          = var.Allow_all
    protocol         = "-1"
    cidr_blocks      = var.CIDR_Blocks
  }

  egress {
    description     = var.SG_egress_AWS_name 
    from_port        = var.Allow_all
    to_port          = var.Allow_all
    protocol         = "-1"
    cidr_blocks      = var.CIDR_Blocks
  }

    tags = {
    Name = "SG-allow-all"
  }
}
