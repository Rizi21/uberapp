resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
}


resource "aws_internet_gateway_attachment" "vpc_gateway_attachment" {
  vpc_id             = aws_vpc.vpc.id
  internet_gateway_id = aws_internet_gateway.internet_gateway.id
}