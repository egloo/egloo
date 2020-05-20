resource "aws_s3_bucket" "keycloak_alb_logs" {
  bucket = "keycloak-alb-logs"
  acl    = "private"

  tags = {
    Name        = "keyloak-alb-logs"
    Environment = "prod"
    Terraform   = "true"
  }
}
