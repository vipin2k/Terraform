variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list 
}

variable "dns_servers" {
  type = list
}

variable "subnet_name1" {
  type = string
}

variable "address_prefix" {
  type = list
}

variable "subnet_name2" {
  type = string
}

variable "address_prefix" {
  type = list
}
