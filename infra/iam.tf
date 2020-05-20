module "iam_iam_user_circleci" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "2.9.0"
  # insert the 1 required variable here

  name = "circleci"

  create_iam_access_key = true
  create_iam_user_login_profile = false
}

# resource "aws_iam_policy" "circleci_prod_egloo_web_s3_policy" {
#   name        = "prod-egloo-web-s3"
#   description = "Access to modify the egloo-web S3 bucket"
#   policy      = "" # insert policy here
# }

# resource "aws_iam_user_policy_attachment" "test-attach" {
#   user       = "${aws_iam_user.user.name}"
#   policy_arn = "${aws_iam_policy.policy.arn}"
# }

module "iam_iam_user_cooper" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "2.9.0"
  # insert the 1 required variable here

  name = "cooper"

  create_iam_access_key = true
  create_iam_user_login_profile = false
}

# module "iam_group_with_policies" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
#   version = "~> 2.0"

#   name = "superadmins"

#   group_users = [
#     "circleci",
#     "cooper"
#   ]

#   attach_iam_self_management_policy = true

#   custom_group_policy_arns = [
#     "arn:aws:iam::aws:policy/AdministratorAccess",
#   ]

#   custom_group_policies = [
#     {
#       name   = "AllowS3Listing"
#       policy = data.aws_iam_policy_document.sample.json
#     }
#   ]
# }

module "iam_iam_user_keycloak_ses" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "2.9.0"

  name = "keycloak.ses"

  create_iam_user_login_profile = false
  create_iam_access_key         = true
}

data "aws_iam_policy_document" "ses_send_raw_email" {
  statement {
    sid       = "AllowFullSESSendRawEmail"
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

module "iam_policy_ses_send_raw_email" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "2.9.0"

  name        = "ses_send_raw_email"
  path        = "/"
  description = "SES Send Raw Email"

  policy = data.aws_iam_policy_document.ses_send_raw_email.json
}

resource "aws_iam_user_policy_attachment" "keycloak_ses_send_raw" {
  user       = module.iam_iam_user_keycloak_ses.this_iam_user_name
  policy_arn = module.iam_policy_ses_send_raw_email.arn
}

data "aws_iam_policy_document" "s3_allow_ses_puts" {
  statement {
    sid    = "allow-ses-puts"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ses.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${var.ses_bucket}/${var.ses_bucket_prefix}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:Referer"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
}
