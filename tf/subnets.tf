resource "aws_subnet" "subnet_hub" {
    vpc_id                  = aws_vpc.vpc_hub.id
    cidr_block              = "10.0.0.0/24"
    map_public_ip_on_launch = true
    availability_zone        = "eu-central-1a"

    tags = {
        Name = "Subnet-Hub"
    }
}

resource "aws_subnet" "subnet_spoke_container_private" {
    vpc_id                  = aws_vpc.vpc_spoke_container.id
    cidr_block              = "172.16.1.0/28"
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = false

    tags = {
        Name = "Subnet-Spoke-Container-Private"
    }
}

resource "aws_subnet" "subnet_spoke_monitoring_private" {
    vpc_id                  = aws_vpc.vpc_spoke_monitoring.id
    cidr_block              = "172.16.2.0/28"
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = false

    tags = {
        Name = "Subnet-Spoke-Monitoring-Private"
    }
}

resource "aws_subnet" "subnet_spoke_data_private" {
    vpc_id                  = aws_vpc.vpc_spoke_data.id
    cidr_block              = "172.16.3.0/28"
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = false

    tags = {
        Name = "Subnet-Spoke-Data-Private"
    }
}