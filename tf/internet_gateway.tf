resource "aws_internet_gateway" "igw_hub" {
  vpc_id = aws_vpc.vpc_hub.id

  tags = {
    Name = "IGW-Hub"
  }
}