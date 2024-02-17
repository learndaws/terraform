variable "zone_id" {
    type = string 
    default = "Z08149982GBIICXQF76PI"
}

variable "instance_names" {
    type = map(string)
    default = {
        "DB-Mongo" = "t3.small"
        "DB-Redis" = "t2.micro"
        "DB-Mysql" = "t3.small"
        "DB-Rabbit-mq" = "t2.micro"
        "API-Catalogue" = "t2.micro"
        "API-User" = "t2.micro"
        "API-Cart" = "t2.micro"
        "API-Shipping" = "t3.small"
        "API-Payments" = "t2.micro"
        "API-Ratings" = "t2.micro"
        "Web" = "t2.micro"
    }
}