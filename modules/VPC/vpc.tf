resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_block

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.stack_name}-VPC"
  }
}