resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Public Subnets"
    Network = "Public"
  }
}

resource "aws_route_table" "private_route_table_01" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Private Subnet AZ1"
    Network = "Private01"
  }
}

resource "aws_route_table" "private_route_table_02" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Private Subnet AZ2"
    Network = "Private02"
  }
}

resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.internet_gateway.id
}

resource "aws_route" "private_route_01" {
  route_table_id = aws_route_table.private_route_table_01.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gateway_01.id
}

resource "aws_route" "private_route_02" {
  route_table_id = aws_route_table.private_route_table_02.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gateway_02.id
}


# <<<------------------------ Route table association -------------------------->>>

resource "aws_subnet_route_table_association" "public_subnet_01_association" {
  subnet_id      = aws_subnet.public_subnet_01.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet_route_table_association" "public_subnet_02_association" {
  subnet_id      = aws_subnet.public_subnet_02.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet_route_table_association" "private_subnet_01_association" {
  subnet_id      = aws_subnet.private_subnet_01.id
  route_table_id = aws_route_table.private_route_table_01.id
}

resource "aws_subnet_route_table_association" "private_subnet_02_association" {
  subnet_id      = aws_subnet.private_subnet_02.id
  route_table_id = aws_route_table.private_route_table_02.id
}