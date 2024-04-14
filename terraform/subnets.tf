resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.base_vpc.id
  cidr_block              = var.public_subnets
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public subnet"
  }
}
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.base_vpc.id
  cidr_block        = var.private_subnets
  availability_zone = var.availability_zones

  tags = {
    Name = "private subnet"
  }
}