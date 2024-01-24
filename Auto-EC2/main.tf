resource "aws_vpc" "proton_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "proton_vpc"
  }
}

resource "aws_subnet" "proton_subnet" {
  vpc_id            = aws_vpc.proton_vpc.id
  cidr_block        = var.subnet_cidr

  tags = {
    Name = "proton_subnet"
  }
}

resource "aws_internet_gateway" "proton_ITGW" {
  vpc_id = aws_vpc.proton_vpc.id

  tags = {
    Name = "proton_ITGW"
  }
}

resource "aws_route_table" "proton_route_table" {
  vpc_id = aws_vpc.proton_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.proton_ITGW.id
  }

  tags = {
    Name = "proton_route_table"
  }
}

resource "aws_route_table_association" "associate_proton_route_table" {
  subnet_id      = aws_subnet.proton_subnet.id
  route_table_id = aws_route_table.proton_route_table.id
}

resource "aws_security_group" "proton_sg" {
  name        = "proton_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.proton_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "proton_sg"
  }
}

resource "aws_instance" "Proton_server_Dev" {
  count                         = var.instance_count
  ami                           = var.ami
  instance_type                 = var.instance_type
  subnet_id                     = aws_subnet.proton_subnet.id
  vpc_security_group_ids        = [aws_security_group.proton_sg.id]
  key_name                      = var.key_name
  associate_public_ip_address   = true

  tags = {
    Name = "Proton_server_Dev-${count.index + 1}"
  }
}

resource "aws_eip" "proton_eip" {
  count    = var.instance_count
  instance = aws_instance.Proton_server_Dev[count.index].id
  domain   = "vpc"
}
