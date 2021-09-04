locals {
  prefix = "opserver"
  az_a   = "ap-southeast-2a"
  az_b   = "ap-southeast-2b"

  vpc_cidr_block = "10.0.0.0/16"

  public_subnet_1_cidr  = "10.0.1.0/24"
  public_subnet_2_cidr  = "10.0.2.0/24"
  private_subnet_1_cidr = "10.0.3.0/24"
  private_subnet_2_cidr = "10.0.4.0/24"

  error_message_json = jsonencode({ "moreInfo" : {
    "code" : "10000",
    "userMessage" : "Bad request",
  } })
}