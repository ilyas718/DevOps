provider "aws" {
  region = "us-east-1"  # Set the AWS region you want to use
}

module "eks" {
  source = "../eks-module"  # Path to your eks-module directory

  # No need to specify variable values here because they are already defined in the module's variables.tf file.
}
