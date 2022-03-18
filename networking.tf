resource "aws_vpc" "kir" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_nag"
  }
}

resource "aws_subnet" "sn" {
  vpc_id     = aws_vpc.kir.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet_nag"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.kir.id

  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.kir.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "route-table"
  }
}
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-buckjffkghdhdhkket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}