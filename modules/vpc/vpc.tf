## Create main VPC, Private and Public Subnets
provider "aws" {
  alias  = "central"
  region = "eu-central-1"
}

resource "aws_vpc" "jumia-vpc-services" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "jumia-vpc-services"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.jumia-vpc-services.id
  cidr_block        = element(var.private_subnet_cidr_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index)
  count             = length(var.private_subnet_cidr_blocks)
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.jumia-vpc-services.id
  cidr_block              = element(var.public_subnet_cidr_blocks, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  count                   = length(var.public_subnet_cidr_blocks)
  map_public_ip_on_launch = true
}
