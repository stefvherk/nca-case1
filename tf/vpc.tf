resource "aws_vpc" "vpc_hub" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-Hub"
  }
}

resource "aws_vpc" "vpc_spoke_container" {
  cidr_block           = "172.16.1.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-Spoke-Container"
  }
}

resource "aws_vpc" "vpc_spoke_monitoring" {
  cidr_block           = "172.16.2.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-Spoke-Monitoring"
  }
}

resource "aws_vpc" "vpc_spoke_data" {
  cidr_block           = "172.16.3.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-Spoke-Data"
  }
}