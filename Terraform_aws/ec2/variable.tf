variable "region" {
    type = string 
}

variable "private_key_algorithm" {
    type = string
}

variable "private_key_bits" {
   type = number
}

variable "key_pair_name" {
  type = string
}

variable "ec2_instances_ami_name" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "tag_name" {
  type = string
}
