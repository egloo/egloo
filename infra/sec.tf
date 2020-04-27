############################
# Prod VPC Security Groups
############################
resource "aws_security_group" "egloo_keycloak_servers" {
  name_prefix = "keycloak-servers-"
  description = "For Keycloak servers"
  vpc_id      = module.egloo_prod_vpc.vpc_id
}

# resource "aws_security_group_rule" "allow_egloo_access" {
#   type                     = "ingress"
#   from_port                = module.rds_aurora_keycloak_serverless.this_rds_cluster_port
#   to_port                  = module.rds_aurora_keycloak_serverless.this_rds_cluster_port
#   protocol                 = "tcp"
#   source_security_group_id = aws_security_group.egloo_keycloak_servers.id
#   security_group_id        = module.rds_aurora_keycloak_serverless.this_security_group_id
# }

# resource "aws_security_group_rule" "allow_keycloak_access" {
#   type                     = "ingress"
#   from_port                = module.rds_aurora_keycloak_serverless.this_rds_cluster_port
#   to_port                  = module.rds_aurora_keycloak_serverless.this_rds_cluster_port
#   protocol                 = "tcp"
#   source_security_group_id = aws_security_group.egloo_keycloak_servers.id
#   security_group_id        = module.rds_aurora_keycloak_serverless.this_security_group_id
# }

resource "aws_security_group_rule" "allow_keycloak_access" {
  type                     = "ingress"
  from_port                = module.rds_aurora_keycloak_cluster.this_rds_cluster_port
  to_port                  = module.rds_aurora_keycloak_cluster.this_rds_cluster_port
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.egloo_keycloak_servers.id
  security_group_id        = module.rds_aurora_keycloak_cluster.this_security_group_id
}
