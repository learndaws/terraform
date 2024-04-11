variable "cidr_block" {
    type = string 
    default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type        = bool
  default     = "true"
}

variable "common_tags" {
    type = map
    default = {
        project = "roboshop"
        terraform = "true"
        Function = "common"
    }
}

variable "vpc_function_tags" {
    type = map
}

variable "igw_function_tags" {
    type = map
}

variable "public_subnets_function_tags" {
    type = map
}

variable "private_subnets_function_tags" {
    type = map
}

variable "database_subnets_function_tags" {
    type = map
}

variable "nat_gw_function_tags" {
    type = map
}

variable "rt_function_tags" {
    type = map
}

variable "vpc_hostname" {
  type        = string
}

variable "igw_hostname" {
  type        = string
}

variable "public_subnets_hostname" {
  type        = string
}

variable "private_subnets_hostname" {
  type        = string
}

variable "database_subnets_hostname" {
  type        = string
}

variable "nat_gw_hostname" {
  type        = string
}

variable "rt_public_hostname" {
  type        = string
}

variable "rt_private_hostname" {
  type        = string
}

variable "rt_database_hostname" {
  type        = string
}

variable "public_cidr_block" {
  type = list
    validation {
    condition = length(var.public_cidr_block) == 2
    error_message = "please give only 2 public subnets"
  }
}

variable "private_cidr_block" {
  type = list
    validation {
    condition = length(var.private_cidr_block) == 3
    error_message = "please give only 3 public subnets"
  }
}

variable "database_cidr_block" {
  type = list
    validation {
    condition = length(var.database_cidr_block) == 4
    error_message = "please give only 4 public subnets"
  }
}

variable "vpc_peering_required" {
  type = bool
  default = false
}

variable "peer_vpc_id" {
  type = string 
  default = ""
}




