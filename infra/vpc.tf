######################################
# VPC and Subnets
######################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

module "egloo_prod_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.33.0"

  name = "egloo-prod"

  cidr = "10.0.0.0/16"

  azs                 = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  database_subnets    = ["10.0.50.0/24", "10.0.51.0/24", "10.0.52.0/24"]
  elasticache_subnets = ["10.0.75.0/24", "10.0.76.0/24", "10.0.77.0/24"]
  public_subnets      = ["10.0.100.0/24", "10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  enable_vpn_gateway = true

  # enable_public_redshift = true

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }
}
