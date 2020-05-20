module "keycloak_ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.13.0"

  name           = "keycloak"
  instance_count = 1

  ami                    = "ami-04590e7389a6e577c"
  instance_type          = "t2.medium"
  key_name               = "prod"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.egloo_keycloak_servers.id]
  subnet_id              = module.egloo_prod_vpc.public_subnets[0]

  # For now
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }
}
