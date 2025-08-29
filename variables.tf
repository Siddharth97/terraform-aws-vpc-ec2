variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_suffix" {
  type    = list(string)
  default = ["0/24","1/24","2/24"]
}

variable "private_subnet_suffix" {
  type    = list(string)
  default = ["10/24","11/24","12/24"]
}
