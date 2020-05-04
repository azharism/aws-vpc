locals {
  sg_name                   = join("-",[var.resource_prefix,"custom","sg"])
}

resource "aws_default_security_group" "plygenom-default" {
  vpc_id                     = aws_vpc.plygenom.id

  ingress {
    protocol                 = -1
    self                     = true
    from_port                = 0
    to_port                  = 0
  }

  egress {
    from_port                = 0
    to_port                  = 0
    protocol                 = "-1"
    cidr_blocks              = ["0.0.0.0/0"]
  }

  tags                       = merge(var.tags, map("Service", "security_group", "Name","plygenom-default-sg"))
}

resource "aws_security_group" "security_group" {
  name                       = local.sg_name
  description                = "plygenom security-Group"
  vpc_id                     = aws_vpc.plygenom.id
  tags                       = merge(var.tags, map("Service", "security_group", "Name","${local.sg_name}"))
}


resource "aws_security_group_rule" "outbound" {
  type              = "egress"
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  cidr_blocks       = [var.vpc_cidr_block]
  description       = "Allow to access other subnets within VPC"
  security_group_id = aws_security_group.security_group.id
}


resource "aws_security_group_rule" "inbound" {
  count             = 2

  type              = "ingress"
  from_port         = element(split(",", "443,80"), count.index)
  to_port           = element(split(",", "443,80"), count.index)
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr_block]
  description       = ""
  security_group_id = aws_security_group.security_group.id
}