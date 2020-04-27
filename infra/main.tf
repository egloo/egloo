provider "aws" {
  profile = "egloo"
  region  = "us-west-2"
}

#########################
# NEXT EC2 Cluster Group
#########################

# module "ec2_cluster" {
#   source                 = "terraform-aws-modules/ec2-instance/aws"
#   version                = "~> 2.0"

#   name                   = "egloo"
#   instance_count         = 2

#   ami                    = "ami-04590e7389a6e577c"
#   instance_type          = "t2.medium"
#   key_name               = "demo"
#   monitoring             = true
#   vpc_security_group_ids = [aws_security_group.app_servers.id]
#   subnet_id              = "subnet-0da9bd46"

#   # For now
#   associate_public_ip_address = true

#   tags = {
#     Terraform   = "true"
#     Environment = "demo"
#   }
# }
