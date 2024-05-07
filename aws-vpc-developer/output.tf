output "azs" {
    value = data.aws_availability_zones.available
}

output "test-public-subnets" {
    value = local.req_public_available_zones
}

output "test-private-subnets" {
    value = local.req_private_available_zones
}

output "test-database-subnets" {
    value = local.req_database_available_zones
}

output "vpc_id" {
    value = aws_vpc.roboshop.id
}