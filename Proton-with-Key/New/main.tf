# Create an AWS EC2 instance for NIFI SERVER

resource "aws_instance" "proton-nifi-ec2" {
  ami                    = var.ami_id                             # provide your desired AMI ID
  instance_type          = var.instance_type                      # Provide your desired instance type
  vpc_security_group_ids = [aws_security_group.proton-nifi-sg.id] # Provide your security group id
  key_name               = var.key_names[0]
  subnet_id = aws_subnet.proton-subnet-ap-south-1a.id
  # Specify block device with size for the root volume
  root_block_device {
    volume_size = var.volume_sizes[0]
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = var.instance_names[0]
  }
}

# Create an AWS EC2 instance for NODE SERVER

resource "aws_instance" "proton-node-ec2" {
  ami                    = var.ami_id                             # provide your desired AMI ID
  instance_type          = var.instance_type                      # Provide your desired instance type
  vpc_security_group_ids = [aws_security_group.proton-node-sg.id] # Provide your security group id
  key_name               = var.key_names[1]
  subnet_id = aws_subnet.proton-subnet-ap-south-1a.id

  # Specify block device with size for the root volume
  root_block_device {
    volume_size = var.volume_sizes[1]
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = var.instance_names[1]
  }
}

# Create an AWS EC2 instance for FRONTEND SERVER

resource "aws_instance" "proton-frontend-ec2" {
  ami                    = var.ami_id                                 # provide your desired AMI ID
  instance_type          = var.instance_type                          # Provide your desired instance type
  vpc_security_group_ids = [aws_security_group.proton-frontend-sg.id] # Provide your security group id
  key_name               = var.key_names[2]
  subnet_id = aws_subnet.proton-subnet-ap-south-1a.id
  # Specify block device with size for the root volume
  root_block_device {
    volume_size = var.volume_sizes[2]
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = var.instance_names[2]
  }
}

# Create an AWS EC2 instance for MONGODB SERVER

resource "aws_instance" "proton-mongodb-ec2" {
  ami                    = var.ami_id                                # provide your desired AMI ID
  instance_type          = var.instance_type                         # Provide your desired instance type
  vpc_security_group_ids = [aws_security_group.proton-mongodb-sg.id] # Provide your security group id
  key_name               = var.key_names[3]
  subnet_id = aws_subnet.proton-subnet-ap-south-1a.id

  # Specify block device with size for the root volume
  root_block_device {
    volume_size = var.volume_sizes[3]
  }

  metadata_options {
    http_tokens = "required"
  }


  tags = {
    Name = var.instance_names[3]
  }
}

# Create an AWS EC2 instance for DEBEZIUM SERVER

resource "aws_instance" "proton-debezium-ec2" {
  ami                    = var.ami_id                                 # provide your desired AMI ID
  instance_type          = var.instance_type                          # Provide your desired instance type
  vpc_security_group_ids = [aws_security_group.proton-debezium-sg.id] # Provide your security group id
  key_name               = var.key_names[4]
  subnet_id = aws_subnet.proton-subnet-ap-south-1a.id

  # Specify block device with size for the root volume
  root_block_device {
    volume_size = var.volume_sizes[4]
  }

  metadata_options {
    http_tokens = "required"
  }


  tags = {
    Name = var.instance_names[4]
  }
}

# CONFIGURATION of VPC

resource "aws_vpc" "proton-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# CONFIGURATION of SUBNET

resource "aws_subnet" "proton-subnet-ap-south-1a" {
  vpc_id            = aws_vpc.proton-vpc.id
  cidr_block        = var.subnet_cidr_blocks[0]
  availability_zone = var.availability_zones[0]

  tags = {
    Name = var.subnet_names[0]
  }
}

resource "aws_subnet" "proton-subnet-ap-south-1b" {
  vpc_id            = aws_vpc.proton-vpc.id
  cidr_block        = var.subnet_cidr_blocks[1]
  availability_zone = var.availability_zones[1]

  tags = {
    Name = var.subnet_names[1]
  }
}

resource "aws_subnet" "proton-subnet-ap-south-1c" {
  vpc_id            = aws_vpc.proton-vpc.id
  cidr_block        = var.subnet_cidr_blocks[2]
  availability_zone = var.availability_zones[2]

  tags = {
    Name = var.subnet_names[2]
  }
}

# CONFIGURATION of INTERNET GATEWAY

resource "aws_internet_gateway" "proton-igw" {
  vpc_id = aws_vpc.proton-vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

# CONFIGURATION of ROUTE TABLE

resource "aws_route_table" "proton-rt" {
  vpc_id = aws_vpc.proton-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.proton-igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

# ASSOCIATION of ROUTE TABLE

resource "aws_route_table_association" "proton-rt-associate-1" {
  subnet_id = aws_subnet.proton-subnet-ap-south-1a.id

  route_table_id = aws_route_table.proton-rt.id
}

resource "aws_route_table_association" "proton-rt-associate-2" {
  subnet_id = aws_subnet.proton-subnet-ap-south-1b.id

  route_table_id = aws_route_table.proton-rt.id
}

resource "aws_route_table_association" "proton-rt-associate-3" {
  subnet_id = aws_subnet.proton-subnet-ap-south-1c.id

  route_table_id = aws_route_table.proton-rt.id
}

# CONFIGURE ELASTIC IP for NIFI SERVER

resource "aws_eip" "proton-nifi-eip" {
  instance = aws_instance.proton-nifi-ec2.id
  domain   = "vpc"

  tags = {
    Name = var.eip_names[0]
  }
}

# CONFIGURE ELASTIC IP for FRONTEND SERVER

resource "aws_eip" "proton-frontend-eip" {
  instance = aws_instance.proton-frontend-ec2.id
  domain   = "vpc"

  tags = {
    Name = var.eip_names[1]
  }
}

# CONFIGURE ELASTIC IP NODE SERVER

resource "aws_eip" "proton-node-eip" {
  instance = aws_instance.proton-node-ec2.id
  domain   = "vpc"

  tags = {
    Name = var.eip_names[2]
  }
}

# CONFIGURE ELASTIC IP MONGODB SERVER

resource "aws_eip" "proton-mongodb-eip" {
  instance = aws_instance.proton-mongodb-ec2.id
  domain   = "vpc"

  tags = {
    Name = var.eip_names[3]
  }
}

# CONFIGURE ELASTIC IP DEBEZIUM SERVER

resource "aws_eip" "proton-debezium-eip" {
  instance = aws_instance.proton-debezium-ec2.id
  domain   = "vpc"

  tags = {
    Name = var.eip_names[4]
  }
}

# SECURITY GROUPS

# NIFI SG

resource "aws_security_group" "proton-nifi-sg" {
  name   = var.nifi_sg_name
  vpc_id = aws_vpc.proton-vpc.id

  dynamic "ingress" {
    for_each = var.nifi_sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.nifi_sg_ports
    iterator = port
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "all"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


# NODE SG

resource "aws_security_group" "proton-node-sg" {
  name   = var.node_sg_name
  vpc_id = aws_vpc.proton-vpc.id

  dynamic "ingress" {
    for_each = var.node_sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.node_sg_ports
    iterator = port
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "all"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


# FRONTEND SG

resource "aws_security_group" "proton-frontend-sg" {
  name   = var.frontend_sg_name
  vpc_id = aws_vpc.proton-vpc.id

  dynamic "ingress" {
    for_each = var.frontend_sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.frontend_sg_ports
    iterator = port
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "all"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


# MONGODB SG

resource "aws_security_group" "proton-mongodb-sg" {
  name   = var.mongodb_sg_name
  vpc_id = aws_vpc.proton-vpc.id

  dynamic "ingress" {
    for_each = var.mongodb_sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.mongodb_sg_ports
    iterator = port
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "all"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


# DEBEZIUM SG

resource "aws_security_group" "proton-debezium-sg" {
  name   = var.debezium_sg_name
  vpc_id = aws_vpc.proton-vpc.id

  dynamic "ingress" {
    for_each = var.debezium_sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.debezium_sg_ports
    iterator = port
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "all"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

# KEY PAIRS

# NIFI Key

resource "tls_private_key" "nifi-rsa" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "local_file" "nifi-key" {
  content  = tls_private_key.nifi-rsa.private_key_pem
  filename = var.local_file_names[0]
}

resource "aws_key_pair" "nifi_key_pair" {
  key_name   = var.key_names[0]
  public_key = tls_private_key.nifi-rsa.public_key_openssh
}

# NODE Key

resource "tls_private_key" "node-rsa" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "local_file" "node-key" {
  content  = tls_private_key.node-rsa.private_key_pem
  filename = var.local_file_names[1]
}

resource "aws_key_pair" "node_key_pair" {
  key_name   = var.key_names[1]
  public_key = tls_private_key.node-rsa.public_key_openssh
}

# FRONTEND Key

resource "tls_private_key" "frontend-rsa" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "local_file" "frontend-key" {
  content  = tls_private_key.frontend-rsa.private_key_pem
  filename = var.local_file_names[2]
}

resource "aws_key_pair" "frontend_key_pair" {
  key_name   = var.key_names[2]
  public_key = tls_private_key.frontend-rsa.public_key_openssh
}

# MONGODB Key

resource "tls_private_key" "mongodb-rsa" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "local_file" "mongodb-key" {
  content  = tls_private_key.mongodb-rsa.private_key_pem
  filename = var.local_file_names[3]
}

resource "aws_key_pair" "mongodb_key_pair" {
  key_name   = var.key_names[3]
  public_key = tls_private_key.mongodb-rsa.public_key_openssh
}

# DEBEZIUM Key

resource "tls_private_key" "debezium-rsa" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "local_file" "debezium-key" {
  content  = tls_private_key.debezium-rsa.private_key_pem
  filename = var.local_file_names[4]
}

resource "aws_key_pair" "debezium_key_pair" {
  key_name   = var.key_names[4]
  public_key = tls_private_key.debezium-rsa.public_key_openssh
}