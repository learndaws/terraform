resource "aws_vpc_peering_connection" "roboshop_to_default" {
    count = var.vpc_peering_required ? 1 : 0
    vpc_id = aws_vpc.roboshop.id 
    peer_vpc_id = var.peer_vpc_id == "" ? data.aws_vpc.default.id : var.peer_vpc_id
    auto_accept = var.peer_vpc_id == "" ? true : false
}

resource "aws_route" "rtbl_public_vpc_peering" {
  route_table_id            = aws_route_table.rt_public.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = "pcx-0066379570396dc97"  #this one need to be configured with datasource as the peering conn. id changes when we destroy and configure again
}

resource "aws_route" "rtbl_private_vpc_peering" {
  route_table_id            = aws_route_table.rt_private.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = "pcx-0066379570396dc97"  #this one need to be configured with datasource as the peering conn. id changes when we destroy and configure again
}

resource "aws_route" "rtbl_database_vpc_peering" {
  route_table_id            = aws_route_table.rt_database.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = "pcx-0066379570396dc97"  #this one need to be configured with datasource as the peering conn. id changes when we destroy and configure again
}