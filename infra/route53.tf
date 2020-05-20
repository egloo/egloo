data "aws_route53_zone" "egloo_com" {
  name         = "egloo.com."
  private_zone = false
}

resource "aws_route53_record" "keycloak" {
  zone_id = data.aws_route53_zone.egloo_com.zone_id
  name    = "keycloak.egloo.com"
  type    = "A"

  alias {
    name                   = module.keycloak_alb.this_lb_dns_name
    zone_id                = module.keycloak_alb.this_lb_zone_id
    evaluate_target_health = true
  }
}
