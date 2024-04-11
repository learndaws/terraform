resource "aws_vpc_peering_connection" "roboshop_to_default" {
    count = var.vpc_peering_required ? 1 : 0
    vpc_id = aws_vpc.roboshop.id 
    peer_vpc_id = var.peer_vpc_id == "" ? data.aws_vpc.default.id : var.peer_vpc_id
    auto_accept = var.peer_vpc_id == "" ? true : false
}