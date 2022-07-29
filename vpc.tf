resource "aws_vpc" "newvpc" {
  cidr_block       = var.VPC_cidr
  instance_tenancy = "default"
  enable_dns_hostnames  = true

  tags = {
    Name = "newvpc"
  }
}

resource "aws_subnet" "subnet-public-1" {
  vpc_id                  = aws_vpc.newvpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = "true" 
  availability_zone       = var.AZ1

}

resource "aws_subnet" "subnet-private-1" {
  vpc_id                  = aws_vpc.newvpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = var.AZ2

}


resource "aws_subnet" "subnet-private-2" {
  vpc_id                  = aws_vpc.newvpc.id
  cidr_block              = var.subnet3_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = var.AZ3

}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.newvpc.id

}


resource "aws_route_table" "crta-public" {
  vpc_id = aws_vpc.newvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "igroutetable"
  }
}

resource "aws_route_table_association" "crta-public-subnet-1" {
  subnet_id      = aws_subnet.subnet-public-1.id
  route_table_id = aws_route_table.crta-public.id
}