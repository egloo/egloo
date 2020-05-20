resource "aws_acm_certificate" "keycloak_cert" {
  domain_name       = "keycloak.egloo.com"
  validation_method = "DNS"

  tags = {
    Environment = "prod"
    Terraform   = "true"
  }

  lifecycle {
    create_before_destroy = true
  }
}
