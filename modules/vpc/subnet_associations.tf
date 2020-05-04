# Associate Private Subnets to private  Route Table

resource "aws_route_table_association" "private_subnet_assoc" {
  count                      = length(var.availability_zones)
  subnet_id                  = element(aws_subnet.plygenom_private.*.id, count.index)
  route_table_id             = aws_default_route_table.private.id
}

# Associate Public Subnets to Public Route Table

resource "aws_route_table_association" "public_subnet_assoc" {
  count                      = length(var.availability_zones)
  subnet_id                  = element(aws_subnet.plygenom_public.*.id, count.index)
  route_table_id             = aws_route_table.public.id
}

# Associate endpoint Subnets to private  Route Table

resource "aws_route_table_association" "endpoint_subnet_assoc" {
  count                      = length(var.availability_zones)
  subnet_id                  = element(aws_subnet.plygenom_endpoint.*.id, count.index)
  route_table_id             = aws_default_route_table.private.id
}

