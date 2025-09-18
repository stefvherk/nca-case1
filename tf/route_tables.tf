resource "aws_route_table" "rt_hub" {
  vpc_id = aws_vpc.vpc_hub.id
  tags   = { Name = "RT-Hub" }
}

resource "aws_route_table" "rt_spoke_container" {
  vpc_id = aws_vpc.vpc_spoke_container.id
  tags   = { Name = "RT-Spoke-Container" }
}

resource "aws_route_table" "rt_spoke_monitoring" {
  vpc_id = aws_vpc.vpc_spoke_monitoring.id
  tags   = { Name = "RT-Spoke-Monitoring" }
}

resource "aws_route_table" "rt_spoke_data" {
  vpc_id = aws_vpc.vpc_spoke_data.id
  tags   = { Name = "RT-Spoke-Data" }
}