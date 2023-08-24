variable "rg_name" {
  type = string
}

variable "vnet" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "network_interface_name" {
  type = string
}

variable "ip_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "disk_name" {
  type = string
}

variable "os_profile_name" {
  type = string
}

variable "address_prefixes" {
  type = list
}

variable  "address_space" {
  type = list
}

variable "caching" {
  type = string
}

variable "create_option" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "publisher" {
  type = string
}

variable "offer" {
  type = string
}

variable "sku" {
  type = string
}

variable "vrsn" {
  type = string
}

variable "managed_disk_type" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_size" {
  type = string
}