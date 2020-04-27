// aws_rds_cluster eGloo Keycloak
output "egloo_keycloak_rds_cluster_id" {
  description = "The ID of the cluster"
  value       = module.rds_aurora_keycloak_cluster.this_rds_cluster_id
}

output "egloo_keycloak_rds_cluster_resource_id" {
  description = "The Resource ID of the cluster"
  value       = module.rds_aurora_keycloak_cluster.this_rds_cluster_resource_id
}

output "egloo_keycloak_rds_cluster_endpoint" {
  description = "The cluster endpoint"
  value       = module.rds_aurora_keycloak_cluster.this_rds_cluster_endpoint
}

output "egloo_keycloak_rds_cluster_reader_endpoint" {
  description = "The cluster reader endpoint"
  value       = module.rds_aurora_keycloak_cluster.this_rds_cluster_reader_endpoint
}

output "egloo_keycloak_rds_cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = module.rds_aurora_keycloak_cluster.this_rds_cluster_database_name
}

output "egloo_keycloak_rds_cluster_master_password" {
  description = "The master password"
  value       = module.rds_aurora_keycloak_cluster.this_rds_cluster_master_password
  sensitive   = true
}

output "egloo_keycloak_rds_cluster_port" {
  description = "The port"
  value       = module.rds_aurora_keycloak_cluster.this_rds_cluster_port
}

output "egloo_keycloak_rds_cluster_master_username" {
  description = "The master username"
  value       = module.rds_aurora_keycloak_cluster.this_rds_cluster_master_username
}

// aws_rds_cluster_instance
output "egloo_keycloak_rds_cluster_instance_endpoints" {
  description = "A list of all cluster instance endpoints"
  value       = module.rds_aurora_keycloak_cluster.this_rds_cluster_instance_endpoints
}

// aws_security_group
output "egloo_keycloak_security_group_id" {
  description = "The security group ID of the cluster"
  value       = module.rds_aurora_keycloak_cluster.this_security_group_id
}

// aws_rds_cluster eGloo Platform
output "egloo_rds_cluster_id" {
  description = "The ID of the cluster"
  value       = module.rds_aurora_egloo_cluster.this_rds_cluster_id
}

output "egloo_rds_cluster_resource_id" {
  description = "The Resource ID of the cluster"
  value       = module.rds_aurora_egloo_cluster.this_rds_cluster_resource_id
}

output "egloo_rds_cluster_endpoint" {
  description = "The cluster endpoint"
  value       = module.rds_aurora_egloo_cluster.this_rds_cluster_endpoint
}

output "egloo_rds_cluster_reader_endpoint" {
  description = "The cluster reader endpoint"
  value       = module.rds_aurora_egloo_cluster.this_rds_cluster_reader_endpoint
}

output "egloo_rds_cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = module.rds_aurora_egloo_cluster.this_rds_cluster_database_name
}

output "egloo_rds_cluster_master_password" {
  description = "The master password"
  value       = module.rds_aurora_egloo_cluster.this_rds_cluster_master_password
  sensitive   = true
}

output "egloo_rds_cluster_port" {
  description = "The port"
  value       = module.rds_aurora_egloo_cluster.this_rds_cluster_port
}

output "egloo_rds_cluster_master_username" {
  description = "The master username"
  value       = module.rds_aurora_egloo_cluster.this_rds_cluster_master_username
}

// aws_rds_cluster_instance
output "egloo_rds_cluster_instance_endpoints" {
  description = "A list of all cluster instance endpoints"
  value       = module.rds_aurora_egloo_cluster.this_rds_cluster_instance_endpoints
}

// aws_security_group
output "egloo_security_group_id" {
  description = "The security group ID of the cluster"
  value       = module.rds_aurora_egloo_cluster.this_security_group_id
}

// iam_users
output "iam_iam_user_cooper_access_key" {
  description = "The access key for cooper"
  value = module.iam_iam_user_cooper.this_iam_access_key_id
}

output "iam_iam_user_cooper_access_key_secret" {
  description = "The access key secret for cooper"
  value = module.iam_iam_user_cooper.this_iam_access_key_secret
}

output "iam_iam_user_cooper_user_arn" {
  description = "The user arn for cooper"
  value = module.iam_iam_user_cooper.this_iam_user_arn
}

output "iam_iam_user_circleci_access_key" {
  description = "The access key for circleci"
  value = module.iam_iam_user_circleci.this_iam_access_key_id
}

output "iam_iam_user_circleci_access_key_secret" {
  description = "The access key secret for circleci"
  value = module.iam_iam_user_circleci.this_iam_access_key_secret
}

output "iam_iam_user_circleci_user_arn" {
  description = "The user arn for circleci"
  value = module.iam_iam_user_circleci.this_iam_user_arn
}
