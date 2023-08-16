resource "aws_nat_gateway" "nat_gateway_01" {
  allocation_id = aws_eip.nat_gateway_eip_01.id
  subnet_id = aws_subnet.public_subnet_01.id
}

resource "aws_nat_gateway" "nat_gateway_02" {
  allocation_id = aws_eip.nat_gateway_eip_02.id
  subnet_id = aws_subnet.public_subnet_02.id
}