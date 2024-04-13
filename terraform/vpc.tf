resource "aws_vpc" "base_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name : "${var.env} VPC"
  }
}

# internet gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.base_vpc.id
  tags = {
    Name : "${var.env} internet gateway"
  }
}
resource "aws_route_table" "internet_access_through_ig" {
  vpc_id = aws_vpc.base_vpc.id

  tags = {
    Name : "${var.env}-connect-to-internet-through-ig"
  }
}

# keypair
resource "tls_private_key" "web_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "web_vm_keypair" {
  key_name   = "${var.env}_web_vm_keypair"
  public_key = tls_private_key.web_private_key.public_key_openssh
}