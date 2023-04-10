resource "aws_vpc" "main_vpc" {
  cidr_block = var.public_vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  cidr_block = var.public_subnet_cidr
  vpc_id     = aws_vpc.main_vpc.id

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = var.ssh_sg
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "tf_example" {
  ami           = var.linux
  instance_type = var.general_purpose
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
  ]

  tags = {
    Name = var.instance_name
  }
}
