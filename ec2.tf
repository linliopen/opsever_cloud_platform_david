resource "aws_instance" "opsever_instance_1" {
  ami             = "ami-045682e400656aabd"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.private_subnet_1.id
  security_groups = [aws_security_group.opsever_instance_sg.id]

  key_name = "davidlisshkey"

  tags = {
    Name = "${local.prefix}-1"
  }
}

resource "aws_instance" "opsever_instance_2" {
  ami             = "ami-045682e400656aabd"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.private_subnet_2.id
  security_groups = [aws_security_group.opsever_instance_sg.id]

  key_name = "davidlisshkey"

  tags = {
    Name = "${local.prefix}-2"
  }
}
