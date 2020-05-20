

# Keycloak ALB Logs
resource "aws_s3_bucket" "keycloak_alb_logs" {
  bucket = "keycloak-alb-logs"
  acl    = "private"

  tags = {
    Name        = "keyloak-alb-logs"
    Environment = "prod"
    Terraform   = "true"
  }
}

# SES Replies
resource "aws_s3_bucket" "ses_egloo_com" {
  bucket        = var.ses_bucket
  acl           = "private"
  force_destroy = true
  policy        = data.aws_iam_policy_document.s3_allow_ses_puts.json

  logging {
    target_bucket = module.egloo_com_logs.aws_logs_bucket
    target_prefix = "s3/${var.ses_bucket}/"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.ses_egloo_com.id

  # Block new public ACLs and uploading public objects
  block_public_acls = true

  # Retroactively remove public access granted through public ACLs
  ignore_public_acls = true

  # Block new public bucket policies
  block_public_policy = true

  # Retroactivley block public and cross-account access if bucket has public policies
  restrict_public_buckets = true
}
