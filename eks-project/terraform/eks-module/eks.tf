resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "alpha_subnet" {
  cidr_block = var.alpha_subnet_cidr
  vpc_id     = aws_vpc.main_vpc.id
  availability_zone = var.alpha_az

  tags = {
    Name = var.alpha_subnet_name
  }
}

resource "aws_subnet" "beta_subnet" {
  cidr_block = var.beta_subnet_cidr
  vpc_id     = aws_vpc.main_vpc.id
  availability_zone = var.beta_az

  tags = {
    Name = var.beta_subnet_name
  }
}

# Create IAM Role for EKS Cluster
resource "aws_iam_role" "eks_cluster" {
  name = var.eks_cluster_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the AmazonEKSClusterPolicy to the IAM Role for EKS Cluster
resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

# Create the Amazon EKS Cluster
resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = [aws_subnet.alpha_subnet.id] # Use the created subnet ID
  }
}

# Create Managed Node Group (Worker Nodes)
resource "aws_eks_node_group" "workers" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eks_cluster.arn
  subnet_ids      = [aws_subnet.alpha_subnet.id] # Use the created subnet ID

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  instance_types = [var.worker_instance_type] # Use the desired instance type(s)
}

# # Allow inbound HTTP traffic to worker nodes
# resource "aws_security_group_rule" "http_ingress" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   security_group_id = aws_eks_node_group.workers.node_security_group_id

#   cidr_blocks = ["0.0.0.0/0"]  # Allow traffic from any source (Internet)
# }