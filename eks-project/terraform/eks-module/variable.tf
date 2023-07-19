# VPC Cidr Block 
variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Name of VPC
variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "kubernetes"
}

# Subnet Cidr Block for Alpha
variable "alpha_subnet_cidr" {
  description = "CIDR for Alpha Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Subnet Cidr Block for Beta
variable "beta_subnet_cidr" {
  description = "CIDR for Beta Subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# Name of Alpha Subnet
variable "alpha_subnet_name" {
  description = "Alpha Subnet Name"
  type        = string
  default     = "alpha_subnet"
}

# Name of Beta Subnet
variable "beta_subnet_name" {
  description = "Beta Subnet Name"
  type        = string
  default     = "beta_subnet"
}

# Alpha AZ for Subnet
variable "alpha_az" {
  description = "Alpha AZ"
  type        = string
  default     = "us-east-1a"
}

# Beta AZ for Subnet
variable "beta_az" {
  description = "Beta AZ"
  type        = string
  default     = "us-east-1b"
}

# Name of EKS cluster
variable "cluster_name" {
  description = "K8s Cluster Name"
  type        = string
  default     = "kubernetes_cluster"
}

# Name of EKS role
variable "eks_cluster_role" {
  description = "EKS Role Name"
  type        = string
  default     = "kubernetes_role"
}

# Name of Node Group Name
variable "node_group_name" {
  description = "Node Group Name"
  type        = string
  default     = "workers"
}

# Instance type for Worker Nodes
variable "worker_instance_type" {
  description = "Instance Type for Workers"
  type        = string
  default     = "t3.medium"
}