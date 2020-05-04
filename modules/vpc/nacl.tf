locals {
  nacl_name                   = join("-",[var.resource_prefix,"default","nacl"])
}


resource "aws_default_network_acl" "plygenom-default-nacl" {
  default_network_acl_id = aws_vpc.plygenom.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.plygenom.cidr_block
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags                       = merge(var.tags, map("Service", "security_group", "Name","${local.nacl_name}"))
}