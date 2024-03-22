 variable "SG-Specific-Ports" {
    default = [
        {
        description      = "Allow TCP-22"
        from_port        = 22
        to_port          = 22
        protocol         = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
        },
        {
        description      = "Allow TCP-443"
        from_port        = 443
        to_port          = 443
        protocol         = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
        },
        {
        description      = "Allow TCP-9000"
        from_port        = 9000
        to_port          = 9000
        protocol         = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
        },
        {
        description      = "Allow TCP-989"
        from_port        = 989
        to_port          = 989
        protocol         = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
        }
    ]
  }