resource "aws_route53_zone" "publicdns" {
  name         = "aws.domaine.fr"
}

resource "aws_route53_record" "www-a" {
  zone_id = "${aws_route53_zone.publicdns.zone_id}"
  name    = "www-a.aws.domaine.fr"
  type    = "A"
  ttl = "60"
  records = ["${aws_instance.www-a.public_ip}"]
}

resource "aws_route53_record" "www-b" {
  zone_id = "${aws_route53_zone.publicdns.zone_id}"
  name    = "www-b.aws.morot.fr"
  type    = "A"
  ttl = "60"
  records = ["${aws_instance.www-b.public_ip}"]
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.publicdns.zone_id}"
  name = "www.aws.domaine.fr"
  type = "CNAME"
  ttl = "60"
  records = ["${aws_elb.http-lb.dns_name}"]
}


