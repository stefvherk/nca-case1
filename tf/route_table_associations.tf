resource "aws_ec2_transit_gateway_route_table" "rt_egress" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_hub.id

  tags = {
    Name = "TransitGatewayEgressRouteTable"
  }
}

resource "aws_route_table" "rt_hub" {
  vpc_id = aws_vpc.vpc_hub.id

  tags = {
    Name = "HubRouteTable"
  }
}

resource "aws_route" "hub_to_nat_gateway" {
  route_table_id         = aws_route_table.rt_hub.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_hub.id
}

resource "aws_route_table_association" "rta_hub" {
  subnet_id      = aws_subnet.subnet_hub.id
  route_table_id = aws_route_table.rt_hub.id
}

resource "aws_route_table_association" "rta_spoke_container" {
  subnet_id      = aws_subnet.subnet_spoke_container_private.id
  route_table_id = aws_route_table.rt_spoke_container.id
}

resource "aws_route_table_association" "rta_spoke_monitoring" {
  subnet_id      = aws_subnet.subnet_spoke_monitoring_private.id
  route_table_id = aws_route_table.rt_spoke_monitoring.id
}

resource "aws_route_table_association" "rta_spoke_data" {
  subnet_id      = aws_subnet.subnet_spoke_data_private.id
  route_table_id = aws_route_table.rt_spoke_data.id
}

resource "aws_ec2_transit_gateway_route_table_association" "hub_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment_hub.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_egress.id
}

resource "aws_ec2_transit_gateway_route_table_association" "spoke_container_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment_spoke_container.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_egress.id
}

resource "aws_ec2_transit_gateway_route_table_association" "spoke_data_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment_spoke_data.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_egress.id
}

resource "aws_ec2_transit_gateway_route_table_association" "spoke_monitoring_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment_spoke_monitoring.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_egress.id
}
resource "aws_ec2_transit_gateway_route_table_propagation" "propogation_spoke_container" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment_spoke_container.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_egress.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "propogation_spoke_data" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment_spoke_data.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_egress.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "propogation_spoke_monitoring" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment_spoke_monitoring.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_egress.id
}