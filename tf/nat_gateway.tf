resource "aws_nat_gateway" "nat_container" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet_hub.id
  depends_on    = [aws_internet_gateway.igw_hub]
}