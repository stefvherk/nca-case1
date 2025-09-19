resource "aws_ec2_transit_gateway" "tgw_hub" {
  amazon_side_asn = 64512
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment_hub" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_hub.id
  vpc_id             = vpc_hub.id
  subnet_ids         = [aws_subnet.subnet_hub_private.id]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment_spoke_container" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_hub.id
  vpc_id             = vpc_spoke_container.id
  subnet_ids         = [aws_subnet.subnet_spoke_container_private.id]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment_spoke_data" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_hub.id
  vpc_id             = vpc_spoke_data.id
  subnet_ids         = [aws_subnet.subnet_spoke_data_private.id]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment_spoke_monitoring" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_hub.id
  vpc_id             = vpc_spoke_monitoring.id
  subnet_ids         = [aws_subnet.subnet_spoke_monitoring_private.id]
}

