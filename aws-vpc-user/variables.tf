variable "vpc_function_tags" {
    type = map 
    default = {
        Function = "vpc"
        Environment = "Syst"
    }
}

variable "igw_function_tags" {
    type = map 
    default = {
        Function = "igw"
        Environment = "Syst"
    }
}

variable "public_subnets_function_tags" {
    type = map 
    default = {
        Function = "public_subnets"
        Environment = "Syst"
    }
}

variable "private_subnets_function_tags" {
    type = map 
    default = {
        Function = "private_subnets"
        Environment = "Syst"
    }
}

variable "database_subnets_function_tags" {
    type = map 
    default = {
        Function = "database_subnets"
        Environment = "Syst"
    }
}

variable "public_cidr_block" {
    type = list 
    default = ["10.2.2.0/24", "10.2.3.0/24"]
}

variable "private_cidr_block" {
    type = list 
    default = ["10.2.12.0/24", "10.2.13.0/24", "10.2.14.0/24"]
}

variable "database_cidr_block" {
    type = list 
    default = ["10.2.22.0/24", "10.2.23.0/24", "10.2.24.0/24", "10.2.25.0/24"]
}