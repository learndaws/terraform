resource "aws_instance" "MultiEnv-tfvars-ec2" {
    for_each = var.instance_names
    ami = data.aws_ami.new.id
    instance_type = each.value 

    tags = {
        Name = each.key
    }
}

resource "aws_route53_record" "MultiEnv-tfvars-DNS" {
  for_each = aws_instance.MultiEnv-tfvars-ec2
  zone_id = var.zone_id
  name    = "${each.key}.hellodns.xyz"
  type    = "A"
  ttl     = 1
  records = [startswith(each.key, "Web") ? each.value.public_ip : each.value.private_ip]
}