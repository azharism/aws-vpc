
resource "aws_vpc_endpoint" "s3" {

  vpc_id                     = aws_vpc.plygenom.id
  service_name               = "com.amazonaws.ap-southeast-2.s3"
  route_table_ids            = [aws_default_route_table.private.id]
  tags                       = merge(var.tags, map("Service", "endpoint", "Name","s3_endpoint"))
}