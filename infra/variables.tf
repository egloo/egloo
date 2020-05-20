data "aws_caller_identity" "current" {}
data "aws_iam_account_alias" "current" {}
data "aws_partition" "current" {}

variable "ses_bucket" {
  description = "egloo.com SES bucket"
  type        = string
  default     = "ses-egloo-com"
}

variable "ses_bucket_prefix" {
  description = "egloo.com SES bucket prefix"
  type        = string
  default     = "received"
}

variable "region" {
  description = "egloo.com region"
  type        = string
  default     = "us-west-2"
}