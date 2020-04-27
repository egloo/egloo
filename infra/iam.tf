module "iam_iam_user_circleci" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "2.9.0"
  # insert the 1 required variable here

  name = "circleci"

  create_iam_access_key = true
  create_iam_user_login_profile = false
}

resource "aws_iam_policy" "circleci_prod_egloo_web_s3_policy" {
  name        = "prod-egloo-web-s3"
  description = "Access to modify the egloo-web S3 bucket"
  policy      = "" # insert policy here
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = "${aws_iam_user.user.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}

module "iam_iam_user_cooper" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "2.9.0"
  # insert the 1 required variable here

  name = "cooper"

  create_iam_access_key = true
  create_iam_user_login_profile = false
}