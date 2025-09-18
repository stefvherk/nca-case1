resource "aws_vpc_peering_connection" "hub_to_spoke_container" {
    vpc_id        = aws_vpc.vpc_hub.id
    peer_vpc_id   = aws_vpc.vpc_spoke_container.id
    auto_accept   = true

    tags = {
        Name = "Hub-to-Spoke-Container"
    }
}

resource "aws_vpc_peering_connection" "hub_to_spoke_monitoring" {
    vpc_id        = aws_vpc.vpc_hub.id
    peer_vpc_id   = aws_vpc.vpc_spoke_monitoring.id
    auto_accept   = true

    tags = {
        Name = "Hub-to-Spoke-Monitoring"
    }
}

resource "aws_vpc_peering_connection" "hub_to_spoke_data" {
    vpc_id        = aws_vpc.vpc_hub.id
    peer_vpc_id   = aws_vpc.vpc_spoke_data.id
    auto_accept   = true

    tags = {
        Name = "Hub-to-Spoke-Data"
    }
}