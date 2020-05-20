module "keycloak_alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "5.6.0"

  name = "keycloak"

  load_balancer_type = "application"

  vpc_id             = module.egloo_prod_vpc.vpc_id
  subnets            = module.egloo_prod_vpc.public_subnets
  security_groups    = [aws_security_group.egloo_keycloak_alb.id]

  # access_logs = {
  #   bucket = "keycloak-alb-logs"
  # }

  target_groups = [
    {
      name_prefix      = "prod"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      #arn:aws:acm:us-east-1:679642983041:certificate/6e2fd910-7b38-4213-a9d6-254463cacaa1
      certificate_arn    = aws_acm_certificate.keycloak_cert.arn
      target_group_index = 0
    }
  ]

  # http_tcp_listeners = [
  #   {
  #     port               = 80
  #     protocol           = "HTTP"
  #     target_group_index = 0
  #   }
  # ]

  tags = {
    Environment = "prod"
    Terraform   = "true"
  }
}

resource "aws_lb_target_group_attachment" "keycloak_alb_attachment" {
  target_group_arn = module.keycloak_alb.target_group_arns[0]
  target_id        = module.keycloak_ec2_cluster.id[0]
  port             = 80
}
