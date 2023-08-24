resource "tls_private_key" "rsa_4096" {
  algorithm = var.private_key_algorithm
  rsa_bits = var.private_key_bits
}

resource "aws_key_pair" "key_pair" {
  key_name = var.key_pair_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

resource "local_file" "private_key" {
  content = tls_private_key.rsa_4096.private_key_pem
  filename = var.key_pair_name
}

resource "aws_instance" "demo_e2" {
  ami = var.ec2_instances_ami_name
  instance_type = var.ec2_instance_type
  key_name = aws_key_pair.key_pair.key_name
  
  tags = {
    Name = var.tag_name
  }
}