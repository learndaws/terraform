resource "aws_vpc" "roboshop" {
  cidr_block       = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
                var.common_tags,
                var.vpc_function_tags,
                    {
                        Name = var.vpc_hostname
                    }
              )
}

resource "aws_internet_gateway" "roboshop" {
  vpc_id = aws_vpc.roboshop.id

  tags = merge(
                var.common_tags,
                var.igw_function_tags,
                    {
                        Name = var.igw_hostname
                    }
              )
}

resource "aws_subnet" "roboshop_public" {
  count = length(var.public_cidr_block)
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = var.public_cidr_block[count.index]
  availability_zone = local.req_public_available_zones[count.index]

  tags = merge(
                var.common_tags,
                var.public_subnets_function_tags,
                    {
                        Name = var.public_subnets_hostname
                    }
              )
}

resource "aws_subnet" "roboshop_private" {
  count = length(var.private_cidr_block)
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = var.private_cidr_block[count.index]
  availability_zone = local.req_private_available_zones[count.index]

  tags = merge(
                var.common_tags,
                var.private_subnets_function_tags,
                    {
                        Name = var.private_subnets_hostname
                    }
              )
}

resource "aws_subnet" "roboshop_database" {
  count = length(var.database_cidr_block)
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = var.database_cidr_block[count.index]
  availability_zone = local.req_database_available_zones[count.index]

  tags = merge(
                var.common_tags,
                var.database_subnets_function_tags,
                    {
                        Name = var.database_subnets_hostname
                    }
              )
}