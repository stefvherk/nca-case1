resource "aws_eip" "nat_eip" {
  vpc = true

  tags = {
    Name = "NAT_EIP"
  }
}