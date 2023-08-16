resource "aws_eip" "nat_gateway_eip_01" {
  domain = "vpc"
}

resource "aws_eip" "nat_gateway_eip_02" {
  domain = "vpc"
}