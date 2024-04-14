resource "aws_subnet" "lb_subnets" {
  count  = 2
  vpc_id = aws_vpc.base_vpc.id
  cidr_block        = var.alb_subnets[count.index]
  availability_zone = var.availability_zones

  tags = { Name : "web-public-lb-subnet-${count.index}" }
}


resource "aws_route_table_association" "lb_internet_rt" {
  count          = 2
  subnet_id      = aws_subnet.lb_subnets[count.index].id
  route_table_id = aws_route_table.main_rt.id
}


module "public_traefik_alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.7"

  name               = "web-public-alb"
  load_balancer_type = "application"

  vpc_id          = aws_vpc.base_vpc.id            // aws_vpc.base_vpc.id
  subnets         = aws_subnet.lb_subnets[*].id    // aws_subnet.lb_subnets.*.id
  security_groups = [aws_security_group.alb_sg.id] // [ aws_security_group.allow_lb_traffic.id ]

  listener_ssl_policy_default = "ELBSecurityPolicy-TLS-1-2-2017-01"
  idle_timeout                = 1800

  target_groups = [
    {
      name             = "web-public-traefik"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        path     = "/ping"
        port     = 8080
        protocol = "HTTP"
        matcher  = "200"
      }
    }
  ]

  https_listeners = [
    {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = var.ssl_certificate
      action_type     = "fixed-response"
      fixed_response = {
        status_code  = "401"
        content_type = "text/plain"
        message_body = "FORBIDDEN"
      }
    }
  ]

  https_listener_rules = [
    {
      https_listener_index = 0
      priority             = 100

      actions = [
        {
          type               = "forward"
          target_group_index = 0
        }
      ]

      conditions = [
        {
          host_headers = [
            "*portal.immedis.com",
            "*external-api.immedis.com",
            "*hcmpartner-api.immedis.com",
            "*mobile-api.immedis.com"
          ] # values(module.public_application_records.route53_record_fqdn)
        }
      ]
    }
  ]

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]
}
