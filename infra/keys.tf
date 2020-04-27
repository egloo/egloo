#########################
# eGloo Prod Key Pair
#########################
resource "aws_key_pair" "prod" {
  key_name   = "prod"
  public_key = file("${path.module}/keys/egloo_prod.pub")
}

