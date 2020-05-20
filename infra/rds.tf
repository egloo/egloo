resource "aws_db_parameter_group" "aurora_db_postgres116_parameter_group" {
  name        = "egloo-aurora-db-postgres116-parameter-group"
  family      = "aurora-postgresql11"
  description = "egloo-aurora-db-postgres116-parameter-group"
}

resource "aws_rds_cluster_parameter_group" "aurora_cluster_postgres116_parameter_group" {
  name        = "egloo-aurora-postgres116-cluster-parameter-group"
  family      = "aurora-postgresql11"
  description = "egloo-aurora-postgres116-cluster-parameter-group"
}

#############
# RDS Aurora Serverless (eGloo + Keycloak)
#############
# module "rds_aurora_keycloak_serverless" {
#   source  = "terraform-aws-modules/rds-aurora/aws"
#   version = "2.17.0"

#   name                  = "aurora-egloo-keycloak-postgresql"
#   engine                = "aurora-postgresql"
#   # engine_mode           = "serverless"
#   engine_version        = "11.6"
#   instance_type         = "db.r4.large"
#   replica_scale_enabled = false
#   replica_count         = 0

#   vpc_id  = module.egloo_prod_vpc.vpc_id
#   subnets = module.egloo_prod_vpc.database_subnets

#   # Serverless
#   # scaling_configuration = {
#   #   auto_pause               = true
#   #   max_capacity             = 256
#   #   min_capacity             = 2
#   #   seconds_until_auto_pause = 300
#   #   timeout_action           = "ForceApplyCapacityChange"
#   # }

#   monitoring_interval = 60
#   skip_final_snapshot = true
#   storage_encrypted   = true

#   apply_immediately               = true
#   db_parameter_group_name         = aws_db_parameter_group.aurora_db_postgres116_parameter_group.id
#   db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_cluster_postgres116_parameter_group.id
#   enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
# }

module "rds_aurora_keycloak_cluster" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "2.17.0"

  name                  = "aurora-egloo-keycloak-postgresql"
  engine                = "aurora-postgresql"
  # engine_mode           = "serverless"
  engine_version        = "11.6"
  instance_type         = "db.r4.large"
  # replica_scale_enabled = false
  # replica_count         = 0

  vpc_id  = module.egloo_prod_vpc.vpc_id
  subnets = module.egloo_prod_vpc.database_subnets

  # Serverless
  # scaling_configuration = {
  #   auto_pause               = true
  #   max_capacity             = 256
  #   min_capacity             = 2
  #   seconds_until_auto_pause = 300
  #   timeout_action           = "ForceApplyCapacityChange"
  # }

  monitoring_interval = 60
  skip_final_snapshot = true
  storage_encrypted   = true

  apply_immediately               = true
  db_parameter_group_name         = aws_db_parameter_group.aurora_db_postgres116_parameter_group.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_cluster_postgres116_parameter_group.id
  # enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
}

# module "rds_aurora_egloo_serverless" {
#   source  = "terraform-aws-modules/rds-aurora/aws"
#   version = "2.17.0"

#   name                  = "aurora-egloo-postgresql"
#   engine                = "aurora-postgresql"
#   # engine_mode           = "serverless"
#   engine_version        = "11.6"
#   instance_type         = "db.r4.large"
#   # replica_scale_enabled = false
#   # replica_count         = 0

#   vpc_id  = module.egloo_prod_vpc.vpc_id
#   subnets = module.egloo_prod_vpc.database_subnets

#   # Serverless
#   # scaling_configuration = {
#   #   auto_pause               = true
#   #   max_capacity             = 256
#   #   min_capacity             = 2
#   #   seconds_until_auto_pause = 300
#   #   timeout_action           = "ForceApplyCapacityChange"
#   # }

#   monitoring_interval = 60
#   skip_final_snapshot = true
#   storage_encrypted   = true

#   apply_immediately               = true
#   db_parameter_group_name         = aws_db_parameter_group.aurora_db_postgres116_parameter_group.id
#   db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_cluster_postgres116_parameter_group.id
#   enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
# }

# module "rds_aurora_egloo_cluster" {
#   source  = "terraform-aws-modules/rds-aurora/aws"
#   version = "2.17.0"

#   name                  = "aurora-egloo-postgresql"
#   engine                = "aurora-postgresql"
#   # engine_mode           = "serverless"
#   engine_version        = "11.6"
#   instance_type         = "db.r4.large"
#   # replica_scale_enabled = false
#   # replica_count         = 0

#   vpc_id  = module.egloo_prod_vpc.vpc_id
#   subnets = module.egloo_prod_vpc.database_subnets

#   # Serverless
#   # scaling_configuration = {
#   #   auto_pause               = true
#   #   max_capacity             = 256
#   #   min_capacity             = 2
#   #   seconds_until_auto_pause = 300
#   #   timeout_action           = "ForceApplyCapacityChange"
#   # }

#   monitoring_interval = 60
#   skip_final_snapshot = true
#   storage_encrypted   = true

#   apply_immediately               = true
#   db_parameter_group_name         = aws_db_parameter_group.aurora_db_postgres116_parameter_group.id
#   db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_cluster_postgres116_parameter_group.id
#   # enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
# }
