output "elb_dns_name" {
  value = "${aws_elb.http-lb.dns_name}"
}

output "www-a_ip" {
  value = "${aws_instance.www-a.public_ip}"
}

output "www-b_ip" {
  value = "${aws_instance.www-b.public_ip}"
}


