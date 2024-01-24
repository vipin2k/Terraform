variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.10.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  default     = "10.10.0.0/24"
}

variable "instance_type" {
  description = "The instance type to use"
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI to use"
  default     = "ami-0d3f444bc76de0a79"
}

variable "key_name" {
  description = "The key pair name to use"
  default     = "Linux-Key"
}

variable "instance_count" {
  description = "The number of instances to create"
  default     = 2
}
