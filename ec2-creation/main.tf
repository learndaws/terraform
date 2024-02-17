resource "aws_route53_record" "www" {
  zone_id = "Z08149982GBIICXQF76PI"
  name    = "abc.hellodns.xyz"
  type    = "A"
  ttl     = 1
  records = ["10.1.1.1"]
}

