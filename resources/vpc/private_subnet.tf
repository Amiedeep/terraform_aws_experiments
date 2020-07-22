resource "aws_subnet" "private_subnet" {
  count =  length(data.aws_availability_zones.available.names)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  cidr_block = cidrsubnet(var.primary_cidr, 8, length(data.aws_availability_zones.available.names)+count.index)
  vpc_id     = aws_vpc.main_vpc.id

  tags = {
    Name = "private subnet"
  }
}

resource "aws_eip" "nat" {
  tags = {
    Name = "Nat eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet.0.id
  tags = {
    Name = "Nat gateway"
  }
}

resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "Private subnet route table"
  }
}

resource "aws_route_table_association" "private_subnet_route_table_association" {
  count =  length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.private_subnet.*.id[count.index]
  route_table_id = aws_route_table.private_subnet_route_table.id
}

resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.private_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

