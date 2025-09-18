resource "aws_internet_gateway" "igw_hub" {
    vpc_id = aws_vpc.vpc_hub.id

    tags = {
        Name = "IGW-Hub"
    }
}

resource "aws_route_table" "rt_hub" {
    vpc_id = aws_vpc.vpc_hub.id

    tags = {
        Name = "RT-Hub"
    }
}

resource "aws_route" "default_route_hub" {
    route_table_id         = aws_route_table.rt_hub.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.igw_hub.id
}

resource "aws_route_table_association" "rta_hub" {
    subnet_id      = aws_subnet.subnet_hub.id
    route_table_id = aws_route_table.rt_hub.id
}

resource "aws_subnet" "subnet_hub" {
    vpc_id                  = aws_vpc.vpc_hub.id
    cidr_block              = "10.0.0.0/24"
    map_public_ip_on_launch = true
    availability_zone        = "eu-central-1a"

    tags = {
        Name = "Subnet-Hub"
    }
}