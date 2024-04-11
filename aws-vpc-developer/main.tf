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

resource "aws_eip" "eip_1" {
  domain           = "vpc"
}

resource "aws_nat_gateway" "nat_gw_1" {
  allocation_id = aws_eip.eip_1.id
  subnet_id     = aws_subnet.roboshop_public[0].id

  tags = merge(
                var.common_tags,
                var.nat_gw_function_tags,
                    {
                        Name = var.nat_gw_hostname
                    }
              )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.roboshop]
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.roboshop.id

  tags = merge(
                var.common_tags,
                var.rt_function_tags,
                    {
                        Name = var.rt_public_hostname
                    }
              )
}

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.roboshop.id

  tags = merge(
                var.common_tags,
                var.rt_function_tags,
                    {
                        Name = var.rt_private_hostname
                    }
              )
}

resource "aws_route_table" "rt_database" {
  vpc_id = aws_vpc.roboshop.id

  tags = merge(
                var.common_tags,
                var.rt_function_tags,
                    {
                        Name = var.rt_database_hostname
                    }
              )
}

resource "aws_route" "rtbl_public" {
    route_table_id            = aws_route_table.rt_public.id
    destination_cidr_block    = "0.0.0.0/0"
    gateway_id                = aws_internet_gateway.roboshop.id
  }

resource "aws_route" "rtbl_public_vpc_peering" {
  route_table_id            = aws_route_table.rt_public.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = "pcx-06ec445952ef7e68a"
}

resource "aws_route" "rtbl_private" {
  route_table_id            = aws_route_table.rt_private.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id                = aws_nat_gateway.nat_gw_1.id
}

resource "aws_route" "rtbl_private_vpc_peering" {
  route_table_id            = aws_route_table.rt_private.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = "pcx-06ec445952ef7e68a"
}

resource "aws_route" "rtbl_database" {
  route_table_id            = aws_route_table.rt_database.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.nat_gw_1.id
}

resource "aws_route" "rtbl_database_vpc_peering" {
  route_table_id            = aws_route_table.rt_database.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = "pcx-06ec445952ef7e68a"
}

resource "aws_route_table_association" "rta_public" {
  count = length(var.public_cidr_block)
  subnet_id      = element(aws_subnet.roboshop_public[*].id, count.index)
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rta_private" {
  count = length(var.private_cidr_block)
  subnet_id      = element(aws_subnet.roboshop_private[*].id, count.index)
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "rta_database" {
  count = length(var.database_cidr_block)
  subnet_id      = element(aws_subnet.roboshop_database[*].id, count.index)
  route_table_id = aws_route_table.rt_database.id
}