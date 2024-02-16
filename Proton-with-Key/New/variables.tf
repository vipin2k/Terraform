variable "region" {
  type        = string
  description = "Name of the region"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_names" {
  description = "List of key names for EC2 instances"
  type        = list(string)
}

variable "algorithm" {
  type    = string
  default = "RSA"
}

variable "local_file_names" {
  type = list(string)
  description = "List of Local filename for private key"
}

variable "rsa_bits" {
  type    = string
  default = "4096"
}

variable "volume_sizes" {
  description = "List of volume sizes for the EC2 instances"
  type        = list(number)
}

variable "instance_names" {
  description = "List of names for the EC2 instances"
  type        = list(string)
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "subnet_names" {
  type        = list(string)
  description = "Names of the subnets"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for the subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones for the subnets"
}

variable "internet_gateway_name" {
  type        = string
  description = "Name of the Internet Gateway"
}

variable "route_table_name" {
  type        = string
  description = "Name of the route table"
}

variable "eip_names" {
  type        = list(string)
  description = "List of names for Elastic IPs"
}

# NIFI SG Ports and names

variable "nifi_sg_ports" {
  type        = list(number)
  description = "list of ingress and egress ports for NIFI SERVER"
}
variable "nifi_sg_name" {
  description = "Name of the NIFI security group"
  type        = string
}

# NODE SG Ports and names

variable "node_sg_ports" {
  type        = list(number)
  description = "list of ingress and egress ports for NODE SERVER"
}
variable "node_sg_name" {
  description = "Name of the NODE security group"
  type        = string
}

# FRONTEND SG Ports and names

variable "frontend_sg_ports" {
  type        = list(number)
  description = "list of ingress and egress ports for FRONTEND SERVER"
}
variable "frontend_sg_name" {
  description = "Name of the FRONTEND security group"
  type        = string
}

# MONGODB SG Ports and names

variable "mongodb_sg_ports" {
  type        = list(number)
  description = "list of ingress and egress ports for MONGODB SERVER"
}
variable "mongodb_sg_name" {
  description = "Name of the MONGODB security group"
  type        = string
}

# DEBEZIUM SG Ports and names

variable "debezium_sg_ports" {
  type        = list(number)
  description = "list of ingress and egress ports for DEBEZIUM SERVER"
}
variable "debezium_sg_name" {
  description = "Name of the DEBEZIUM security group"
  type        = string
}
