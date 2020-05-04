locals {
  vpc_name                   = join("-",[var.resource_prefix,"vpc"])
  igw_name                   = join("-",[var.resource_prefix,"igw"])
}


resource "aws_vpc" "plygenom" {

  cidr_block                 = var.vpc_cidr_block
  enable_dns_support         = true
  enable_dns_hostnames       = true
  tags                       = merge(var.tags, map("Service", "vpc", "Name","${local.vpc_name}"))
}


resource "aws_internet_gateway" "igw" {

  vpc_id                     = aws_vpc.plygenom.id
  tags                       = merge(var.tags, map("Service", "igw", "Name","${local.igw_name}"))
}