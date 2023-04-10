variable "public_vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
variable "ssh_sg" {
  type    = string
  default = "allow_ssh"
}
variable "linux" {
  type    = string
  default = "ami-016eb5d644c333ccb"
}
variable "general_purpose" {
  type    = string
  default = "t2.micro"
}
variable "vpc_name" {
  type    = string
  default = "main"
}
variable "subnet_name" {
  type    = string
  default = "public"
}
variable "instance_name" {
  type    = string
  default = "tf_example"
}

