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
    subnet_id = aws_subnet.subnet_spoke_data_private.id
    route_table_id = aws_route_table.rt_spoke_data.id
}
