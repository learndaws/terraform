module "vpc" {
  source = "../aws-vpc-developer"
  
   cidr_block = "10.2.0.0/16"
   vpc_function_tags = var.vpc_function_tags
   igw_function_tags = var.igw_function_tags
   public_subnets_function_tags = var.public_subnets_function_tags
   private_subnets_function_tags = var.private_subnets_function_tags
   database_subnets_function_tags = var.database_subnets_function_tags
   vpc_hostname = "web-syst"
   igw_hostname = "igw-syst"
   public_subnets_hostname = "public-subnet"
   private_subnets_hostname = "private-subnet"
   database_subnets_hostname = "database-subnet"
   public_cidr_block = var.public_cidr_block
   private_cidr_block = var.private_cidr_block
   database_cidr_block = var.database_cidr_block
}