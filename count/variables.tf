variable "ami_id" {
    type = string
    default = "ami-0f3c7d07486cad139"
}

variable "instance_name" {
    default = ["DB-Mongo","DB-Redis","DB-Mysql","DB-Rabbit-mq","API-Catalogue","API-User","API-Cart","API-Shipping","API-Payments","API-Ratings","Web"]
}

variable "zone_id" {
    type = string
    default = "Z08149982GBIICXQF76PI"
}