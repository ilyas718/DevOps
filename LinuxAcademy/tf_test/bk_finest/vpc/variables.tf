variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"

}

variable "public_subnet_cidr_blocks" {
  description = "The list of CIDR blocks to use in building the public subnets. List size needs to match availability zone count"
  type        = list(string)
  default = ["10.0.1.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "The list of CIDR blocks to use in building the private subnets. List size needs to match availability zone count"
  type        = list(string)
  default = ["10.0.2.0/24"]  
}

variable "availability_zones" {
  description = "The list of availability zone to utilize in a given region"
  type        = list(string)
  default     = ["us-east-1a"]
}

variable "environment" {
  description = "The environment type being created"
  type        = string
  default = "webapp"
}
