
resource "aws_vpc_endpoint" "s3" {

  vpc_id                     = aws_vpc.plygenom.id
  service_name               = "com.amazonaws.ap-southeast-2.s3"
  route_table_ids            = [aws_default_route_table.private.id]
  tags                       = merge(var.tags, map("Service", "endpoint", "Name","s3_endpoint"))
}

# Private EndPoint Interface
resource "aws_vpc_endpoint" "secretsmanager" {
  vpc_id              = aws_vpc.plygenom.id
  subnet_ids          = aws_subnet.dba_endpoint.*.id
  service_name        = "com.amazonaws.ap-southeast-2.secretsmanager"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoint_access.id]
  private_dns_enabled = true
  tags                       = merge(var.tags, map("Service", "endpoint", "Name","secretsmanager_endpoint"))
}

# Private EndPoint Interface for ECR - Need two private endpoints one for api and dkr
resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id              = aws_vpc.plygenom.id
  subnet_ids          = aws_subnet.dba_endpoint.*.id
  service_name        = "com.amazonaws.ap-southeast-2.ecr.api"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoint_access.id]
  private_dns_enabled = true
  tags                       = merge(var.tags, map("Service", "endpoint", "Name","ecr-api_endpoint"))
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id              = aws_vpc.plygenom.id
  subnet_ids          = aws_subnet.dba_endpoint.*.id
  service_name        = "com.amazonaws.ap-southeast-2.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoint_access.id]
  private_dns_enabled = true
  tags                       = merge(var.tags, map("Service", "endpoint", "Name","ecr-dkr_endpoint"))
}

#Private Endpoint Interface for ECS - Need 3 interface endpoints

resource "aws_vpc_endpoint" "ecs_agent" {
  vpc_id              = aws_vpc.plygenom.id
  subnet_ids          = aws_subnet.dba_endpoint.*.id
  service_name        = "com.amazonaws.ap-southeast-2.ecs-agent"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoint_access.id]
  private_dns_enabled = true
  tags                       = merge(var.tags, map("Service", "endpoint", "Name","ecs_agent_endpoint"))
}

resource "aws_vpc_endpoint" "ecs_telemetry" {
  vpc_id              = aws_vpc.plygenom.id
  subnet_ids          = aws_subnet.dba_endpoint.*.id
  service_name        = "com.amazonaws.ap-southeast-2.ecs-telemetry"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoint_access.id]
  private_dns_enabled = true
  tags                       = merge(var.tags, map("Service", "endpoint", "Name","ecs_telemetry_endpoint"))
}

resource "aws_vpc_endpoint" "ecs" {
  vpc_id              = aws_vpc.plygenom.id
  subnet_ids          = aws_subnet.dba_endpoint.*.id
  service_name        = "com.amazonaws.ap-southeast-2.ecs"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoint_access.id]
  private_dns_enabled = true
  tags                       = merge(var.tags, map("Service", "endpoint", "Name","ecs_endpoint"))
}

# Private Endpoints for CloudWatch Logs for ECS

resource "aws_vpc_endpoint" "cloudwatch" {
  vpc_id              = aws_vpc.plygenom.id
  subnet_ids          = aws_subnet.dba_endpoint.*.id
  service_name        = "com.amazonaws.ap-southeast-2.logs"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoint_access.id]
  private_dns_enabled = true
  tags                       = merge(var.tags, map("Service", "endpoint", "Name","cloudwatch_endpoint"))
}

### elasticbeanstalk endpoints"

resource "aws_vpc_endpoint" "elasticbeanstalk" {
  vpc_id                          = aws_vpc.plygenom.id
  subnet_ids                      = aws_subnet.dba_endpoint.*.id
  service_name                    = "com.amazonaws.ap-southeast-2.elasticbeanstalk"
  vpc_endpoint_type               = "Interface"
  security_group_ids              = [aws_security_group.endpoint_access.id]
  private_dns_enabled             = true
  tags                            = merge(var.tags, map("Service", "endpoint", "Name","elasticbeanstalk_endpoint"))
}

resource "aws_vpc_endpoint" "elasticbeanstalk-health" {
  vpc_id                          = aws_vpc.plygenom.id
  subnet_ids                      = aws_subnet.dba_endpoint.*.id
  service_name                    = "com.amazonaws.ap-southeast-2.elasticbeanstalk-health"
  vpc_endpoint_type               = "Interface"
  security_group_ids              = [aws_security_group.endpoint_access.id]
  private_dns_enabled             = true
  tags                            = merge(var.tags, map("Service", "endpoint", "Name","elasticbeanstalk-health_endpoint"))
}
