locals {
  private_route_name         = join("-",[var.resource_prefix,"private","route"])
  public_route_name          = join("-",[var.resource_prefix,"public","route"])
}


resource "aws_default_route_table" "private" {

  default_route_table_id     = aws_vpc.plygenom.default_route_table_id
  tags                       = merge(var.tags, map("Service", "route_table", "Name","${local.private_route_name}"))
}


resource "aws_route_table" "public" {

  vpc_id                     = aws_vpc.plygenom.id

  route {
    cidr_block               = "0.0.0.0/0"
    gateway_id               = aws_internet_gateway.igw.id
  }

  tags                       = merge(var.tags, map("Service", "route_table", "Name","${local.public_route_name}"))
}