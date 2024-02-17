resource "aws_instance" "TF-AWS-Instance" {
    for_each = var.instance_names
    ami = data.aws_ami.centos8_joindevops.id
    instance_type = each.value

    tags = {
        Name = each.key
    }
}

resource "aws_route53_record" "TF-AWS-Route53" {
  for_each = aws_instance.TF-AWS-Instance
  zone_id = var.zone_id
  name    = "${each.key}.hellodns.xyz"
  type    = "A"
  ttl     = 1
  records = [each.key == "Web" ? each.value.public_ip : each.value.private_ip]
}


