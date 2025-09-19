resource "aws_route" "default_route_hub" {
  route_table_id         = aws_route_table.rt_hub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_hub.id
}

resource "aws_route" "hub_to_nat_gateway" {
  route_table_id         = aws_route_table.rt_hub.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_hub.id
}

resource "aws_route" "hub_to_spoke_container_route" {
  route_table_id            = aws_route_table.rt_hub.id
  destination_cidr_block    = aws_vpc.vpc_spoke_container.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hub_to_spoke_container.id
}

resource "aws_route" "hub_to_spoke_monitoring_route" {
  route_table_id            = aws_route_table.rt_hub.id
  destination_cidr_block    = aws_vpc.vpc_spoke_monitoring.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hub_to_spoke_monitoring.id
}

resource "aws_route" "hub_to_spoke_data_route" {
  route_table_id            = aws_route_table.rt_hub.id
  destination_cidr_block    = aws_vpc.vpc_spoke_data.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hub_to_spoke_data.id
}

resource "aws_route" "spoke_container_to_hub_route" {
  route_table_id            = aws_route_table.rt_spoke_container.id
  destination_cidr_block    = aws_vpc.vpc_hub.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hub_to_spoke_container.id
}

resource "aws_route" "spoke_monitoring_to_hub_route" {
  route_table_id            = aws_route_table.rt_spoke_monitoring.id
  destination_cidr_block    = aws_vpc.vpc_hub.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hub_to_spoke_monitoring.id
}

resource "aws_route" "spoke_data_to_hub_route" {
  route_table_id            = aws_route_table.rt_spoke_data.id
  destination_cidr_block    = aws_vpc.vpc_hub.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.hub_to_spoke_data.id
}

resource "aws_ec2_transit_gateway_route" "default_to_hub" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_egress.id
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment_hub.id
}