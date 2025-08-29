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

module "ec2" {
  source          = "./modules/ec2"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  ami             = var.instance_ami
  instance_type   = var.instance_type
  key_name        = var.key_name
}