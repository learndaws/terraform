output "aws-vpc-developer-azs" {
    value = module.vpc.azs.names
}

output "zones_avail_public" {
    value = module.vpc.test-public-subnets
}

output "zones_avail_private" {
    value = module.vpc.test-private-subnets
}

output "zones_avail_database" {
    value = module.vpc.test-database-subnets
}

output "ssm_vpc_id" {
    value = module.vpc.vpc_id
}