resource "aws_elb" "http-lb" {
  name = "http-lb"
  subnets = ["${aws_subnet.webservers-a.id}","${aws_subnet.webservers-b.id}"]
  security_groups = ["${aws_security_group.sg_elb.id}"]
  instances       = ["${aws_instance.www-a.id}", "${aws_instance.www-b.id}"]
  listener {
    lb_port = "${var.http_port}"
    lb_protocol = "http"
    instance_port = "${var.http_port}"
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 5
    target = "TCP:${var.http_port}"
  }
}
resource "aws_security_group" "sg_elb" {
  name = "sg_elb"
  vpc_id = "${aws_vpc.vpc_main.id}"

  ingress {
    from_port = "${var.http_port}"
    to_port   = "${var.http_port}"
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

