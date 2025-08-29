variable "vpc_cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "public_subnet_suffix" {
  type = list(string)
}

variable "private_subnet_suffix" {
  type = list(string)
}