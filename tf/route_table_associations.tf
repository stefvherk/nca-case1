resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.subnet_hub.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "db_assoc" {
  subnet_id      = aws_subnet.subnet_data_private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "containers_assoc" {
  subnet_id      = aws_subnet.subnet_container_private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "monitoring_assoc" {
  subnet_id      = aws_subnet.subnet_monitoring_private.id
  route_table_id = aws_route_table.private.id
}