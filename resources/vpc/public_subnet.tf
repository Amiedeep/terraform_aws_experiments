resource "aws_subnet" "public_subnet" {
  count =  length(data.aws_availability_zones.available.names)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = cidrsubnet(var.primary_cidr, 8, count.index)
  vpc_id     = aws_vpc.main_vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = "public subnet"
  }
}

resource "aws_internet_gateway" "public_subnet_gateway" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "Internet gateway"
  }
}

resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "public subnet route table"
  }
}

resource "aws_route_table_association" "public_subnet_route_table_association" {
  count =  length(data.aws_availability_zones.available.names)
  route_table_id = aws_route_table.public_subnet_route_table.id
  subnet_id      = aws_subnet.public_subnet.*.id[count.index]
}

resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public_subnet_gateway.id
}

