############################
# Prod VPC Security Groups
############################
resource "aws_security_group" "egloo_keycloak_servers" {
  name_prefix = "keycloak-servers-"
  description = "For Keycloak servers"
  vpc_id      = module.egloo_prod_vpc.vpc_id
}

resource "aws_security_group" "egloo_keycloak_alb" {
  name_prefix = "keycloak-alb-"
  description = "For Keycloak alb"
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

resource "aws_security_group_rule" "allow_keycloak_ssh_access" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  cidr_blocks              = ["23.242.93.86/32"]
  protocol                 = "tcp"
  security_group_id        = aws_security_group.egloo_keycloak_servers.id
}

resource "aws_security_group_rule" "allow_keycloak_instance_access" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  source_security_group_id = aws_security_group.egloo_keycloak_alb.id
  protocol                 = "tcp"
  security_group_id        = aws_security_group.egloo_keycloak_servers.id
}

resource "aws_security_group_rule" "allow_keycloak_instance_outbound_internet_access" {
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "all"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.egloo_keycloak_servers.id
}

resource "aws_security_group_rule" "allow_keycloak_alb_ssl_access" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  cidr_blocks              = ["0.0.0.0/0"]
  protocol                 = "tcp"
  security_group_id        = aws_security_group.egloo_keycloak_alb.id
}

resource "aws_security_group_rule" "allow_keycloak_alb_outbound_internet_access" {
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "all"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.egloo_keycloak_alb.id
}

