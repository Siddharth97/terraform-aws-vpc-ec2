locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  azs                  = local.azs
  public_subnet_suffix = var.public_subnet_suffix
  private_subnet_suffix= var.private_subnet_suffix
}

