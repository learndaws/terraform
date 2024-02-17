resource "aws_instance" "TF-AWS-Instance" {
    count = length(var.instance_name)
    ami = local.ami
    instance_type = var.instance_name[count.index] == "DB-Mongo" || var.instance_name[count.index] == "DB-Mysql" || var.instance_name[count.index] == "API-Shipping" ? "t3.small" : "t2.micro"

    tags = {
    Name = var.instance_name[count.index]
  }
}

resource "aws_route53_record" "TF-AWS-Route53" {
  count = length(var.instance_name)
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.hellodns.xyz"
  type    = "A"
  ttl     = 1
  records = [var.instance_name[count.index] == "Web" ? aws_instance.TF-AWS-Instance[count.index].public_ip : aws_instance.TF-AWS-Instance[count.index].private_ip]
}