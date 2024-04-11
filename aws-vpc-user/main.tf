module "vpc" {
  source = "../aws-vpc-developer"
  #source = "git::https://github.com/learndaws/terraform.git?ref=main"
  
   cidr_block = "10.2.0.0/16"
   vpc_function_tags = var.vpc_function_tags
   igw_function_tags = var.igw_function_tags
   nat_gw_function_tags = var.nat_gw_function_tags
   rt_function_tags = var.rt_function_tags
   public_subnets_function_tags = var.public_subnets_function_tags
   private_subnets_function_tags = var.private_subnets_function_tags
   database_subnets_function_tags = var.database_subnets_function_tags
   vpc_hostname = "web-syst"
   igw_hostname = "igw-syst"
   nat_gw_hostname = "nat_gw-syst"
   rt_public_hostname = "rt_public-syst"
   rt_private_hostname = "rt_private-syst"
   rt_database_hostname = "rt_database-syst"
   public_subnets_hostname = "public-subnet"
   private_subnets_hostname = "private-subnet"
   database_subnets_hostname = "database-subnet"
   public_cidr_block = var.public_cidr_block
   private_cidr_block = var.private_cidr_block
   database_cidr_block = var.database_cidr_block

   vpc_peering_required = var.vpc_peering_required
}