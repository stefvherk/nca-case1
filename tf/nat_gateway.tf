resource "aws_nat_gateway" "nat_container" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet_spoke_container_public.id
  depends_on    = [aws_internet_gateway.igw_hub]
}