variable "public_subnet_cidr_blocks" {
  type = list
  default = [
    "172.33.10.0/24",
    "172.33.20.0/24",
    "172.33.30.0/24",
  ]
}

variable "private_subnet_cidr_blocks" {
  type = string
  default = [
    "172.33.100.0/24",
    "172.33.110.0/24",
    "172.33.120.0/24",
  ]
}

variable "availability_zones" {
  type = list
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
  ]
}

variable "environment" {
  type    = string
  default = null
}

module "sandbox_vpc" {
  source = "../../modules/vpc"

  availability_zones        = var.availability_zones
  environment               = var.environment
  vpc_cidr_block            = "172.33.0.0/16"
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
}

output "vpc_id" {
  value = module.sandbox_vpc.id
}
