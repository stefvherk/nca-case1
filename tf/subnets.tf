resource "aws_subnet" "subnet_hub" {
  vpc_id                  = aws_vpc.vpc_hub.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "Subnet-Hub"
  }
}

resource "aws_subnet" "subnet_hub_2" {
  vpc_id                  = aws_vpc.vpc_hub.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1b"

  tags = {
    Name = "Subnet-Hub-2"
  }
}

resource "aws_subnet" "subnet_container_private" {
  vpc_id                  = aws_vpc.vpc_hub.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet-Spoke-Container-Private"
  }
}

resource "aws_subnet" "subnet_monitoring_private" {
  vpc_id                  = aws_vpc.vpc_hub.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet-Spoke-Monitoring-Private"
  }
}

resource "aws_subnet" "subnet_data_private" {
  vpc_id                  = aws_vpc.vpc_hub.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet-Spoke-Data-Private"
  }
}