resource "aws_vpc_endpoint" "ssm" {
  vpc_id             = aws_vpc.vpc_hub.id
  service_name       = "com.amazonaws.eu-central-1.ssm"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.subnet_container_private.id] # your private subnet(s)
  security_group_ids = [aws_security_group.sg_container.id]     # allow outbound traffic
}

resource "aws_vpc_endpoint" "ssm_messages" {
  vpc_id             = aws_vpc.vpc_hub.id
  service_name       = "com.amazonaws.eu-central-1.ssmmessages"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.subnet_container_private.id]
  security_group_ids = [aws_security_group.sg_container.id]
}

resource "aws_vpc_endpoint" "ecs" {
  vpc_id             = aws_vpc.vpc_hub.id
  service_name       = "com.amazonaws.eu-central-1.ecs"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.subnet_container_private.id]
  security_group_ids = [aws_security_group.sg_container.id]
}