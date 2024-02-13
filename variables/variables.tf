variable "ami_id" {
    type = string
    default = "ami-0f3c7d07486cad139"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "SG_AWS_name" {
    type = string
    default = "SG-Allow_all"
}

variable "SG_ingress_AWS_name" {
    type = string
    default = "ingress-Allow_all"
}

variable "SG_egress_AWS_name" {
    type = string
    default = "egress-Allow_all"
}

variable "Allow_all" {
    type = number
    default = "0"
}

variable "CIDR_Blocks" {
    type = list
    default = ["0.0.0.0/0"]
}




