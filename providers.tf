provider "aws" {
  region = var.aws_region
  profile = "terraform-user"
}

data "aws_availability_zones" "available" {}