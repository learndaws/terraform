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