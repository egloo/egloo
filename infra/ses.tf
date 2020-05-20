data "aws_route53_zone" "egloo_ses_domain" {
  name = "egloo.com"
}

resource "aws_ses_receipt_rule_set" "egloo_ses_ruleset" {
  rule_set_name = "egloo_ses_ruleset"
}

resource "aws_ses_active_receipt_rule_set" "egloo_ses_ruleset" {
  rule_set_name = aws_ses_receipt_rule_set.egloo_ses_ruleset.rule_set_name
}

module "ses_domain" {
  source                = "trussworks/ses-domain/aws"
  version               = "2.0.5"
  domain_name           = "egloo.com"
  mail_from_domain      = "ses.egloo.com"
  enable_incoming_email = false
  route53_zone_id       = data.aws_route53_zone.egloo_ses_domain.zone_id
  from_addresses        = ["automated@ses.egloo.com"]
  dmarc_rua             = "dmarc@egloo.com"
  receive_s3_bucket     = var.ses_bucket
  receive_s3_prefix     = var.ses_bucket_prefix
  ses_rule_set          = aws_ses_receipt_rule_set.egloo_ses_ruleset.rule_set_name
}
