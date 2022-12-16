
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = korvese
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.11.0/24", "10.0.12.0/24"]
  database_subnets    = ["10.0.21.0/24", "10.0.22.0/24"]

  enable_ipv6 = false

  enable_nat_gateway = false
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "public"
  }
  private_subnet_tags = {
    Name = "private"
  }
  tags = {
    Name = "korvese"
    Env  = "dev"

  vpc_tags = {
    Name = "korvese"
  }
}
