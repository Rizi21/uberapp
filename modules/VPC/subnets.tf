resource "aws_subnet" "public_subnet_01" {
  cidr_block = var.public_subnet01_block
  vpc_id = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, 0)

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.stack_name}-PublicSubnet01"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public_subnet_02" {
  cidr_block = var.public_subnet02_block
  vpc_id = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, 1)

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.stack_name}-PublicSubnet02"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "private_subnet_01" {
  cidr_block = var.private_subnet01_block
  vpc_id = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, 0)

  tags = {
    Name = "${var.stack_name}-PrivateSubnet01"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "private_subnet_02" {
  cidr_block = var.private_subnet02_block
  vpc_id = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, 1)

  tags = {
    Name = "${var.stack_name}-PrivateSubnet02"
    "kubernetes.io/role/internal-elb" = "1"
  }
}
