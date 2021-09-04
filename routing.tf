resource "aws_route_table" "public_rt_1" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.prefix}-public-rt-${local.az_a}"
  }
}

resource "aws_route_table" "public_rt_2" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.prefix}-public-rt-${local.az_b}"
  }
}

resource "aws_route" "public_rt_igw_1" {
  route_table_id         = aws_route_table.public_rt_1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "public_rt_igw_2" {
  route_table_id         = aws_route_table.public_rt_2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_rt_1" {
  route_table_id = aws_route_table.public_rt_1.id
  subnet_id      = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "public_rt_2" {
  route_table_id = aws_route_table.public_rt_2.id
  subnet_id      = aws_subnet.public_subnet_2.id
}

resource "aws_route_table" "private_rt_1" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.prefix}-private-rt-${local.az_a}"
  }
}

resource "aws_route_table" "private_rt_2" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.prefix}-private-rt-${local.az_b}"
  }
}