module "egloo_com_logs" {
  source         = "trussworks/logs/aws"
  version        = "8.0.0"

  region  = var.region
  s3_bucket_name = "egloo-com-logs"
}
