variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "instance_names" {
    type = map
    default = {
        "Web" = "t2.micro"
        "Catalogue" = "t2.micro"
        "Mongodb" = "t3.small"
    }
}

variable "zone_id" {
    type = string
    default = "Z08149982GBIICXQF76PI"
}