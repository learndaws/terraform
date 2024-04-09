locals {
    req_public_available_zones = slice(data.aws_availability_zones.available.names,0,2)
}

locals {
    req_private_available_zones = slice(data.aws_availability_zones.available.names,0,3)
}

locals {
    req_database_available_zones = slice(data.aws_availability_zones.available.names,0,4)
}