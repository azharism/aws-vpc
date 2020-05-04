locals {
  suffix_sequence            = ["01", "02", "03"]
  private_subnet_name        = join("-",[var.resource_prefix,"private","subnet"])
  public_subnet_name         = join("-",[var.resource_prefix,"public","subnet"])
  endpoint_subnet_name       = join("-",[var.resource_prefix,"endpoint","subnet"])
}


resource "aws_subnet" "plygenom_private" {

  count                      = length(var.availability_zones)
  vpc_id                     = aws_vpc.plygenom.id
  availability_zone          = var.availability_zones[count.index]
  cidr_block                 = cidrsubnet(var.vpc_cidr_block, 4, count.index )

  tags                       = merge(var.tags,
                               map("Service", "private_subnet-${element(local.suffix_sequence, count.index)}",
                               "AZ",var.availability_zones[count.index],
                               "Name","${local.private_subnet_name}-${element(local.suffix_sequence, count.index)}"))
}


resource "aws_subnet" "plygenom_public" {

  count                      = length(var.availability_zones)
  vpc_id                     = aws_vpc.plygenom.id
  availability_zone          = var.availability_zones[count.index]
  cidr_block                 = cidrsubnet(var.vpc_cidr_block, 4, count.index + length(var.availability_zones) )

  tags                       = merge(var.tags,
                               map("Service", "public_subnet-${element(local.suffix_sequence, count.index)}",
                               "AZ",var.availability_zones[count.index],
                               "Name","${local.public_subnet_name}-${element(local.suffix_sequence, count.index)}"))
}


resource "aws_subnet" "plygenom_endpoint" {

  count                      = length(var.availability_zones)
  vpc_id                     = aws_vpc.plygenom.id
  availability_zone          = var.availability_zones[count.index]
  cidr_block                 = cidrsubnet(var.vpc_cidr_block, 4, count.index + length(var.availability_zones) + 3 )

  tags                       = merge(var.tags,
                               map("Service", "endpoint_subnet-${element(local.suffix_sequence, count.index)}",
                               "AZ",var.availability_zones[count.index],
                               "Name","${local.endpoint_subnet_name}-${element(local.suffix_sequence, count.index)}"))
}

