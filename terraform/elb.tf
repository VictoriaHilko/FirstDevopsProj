resource "aws_elb" "devops_cource-elb" {
  # name               = "devopscourceelb"

  subnets = [aws_subnet.devops-subnet-public-1.id]

  security_groups = [aws_security_group.devops_cource-all.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [aws_instance.windows-instance-1.id, aws_instance.windows-instance-2.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "devops_cource-elb"
  }
}