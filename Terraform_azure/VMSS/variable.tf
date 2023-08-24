variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list
}

variable "subnet_name" {
  type = string
}

variable "address_prefixes" {
  type = list
}

variable "public_ip_name" {
  type = string
}

variable "allocation_method" {
  type = string
}

variable "sku" {
  type = string
}

variable "lb_name" {
  type = string
}

variable "sku_tier" {
  type = string
}

variable "front_name" {
  type = string
}

variable "loadbalancer_id" {
  type = string
}

variable "backend_name" {
  type = string
}

variable "probe_name" {
  type = string
}

variable "port" {
  type = number
}

variable "protocol" {
  type = string
}

variable "Rule_name" {
  type = string
}

variable "frontend_port" {
  type = number
}

variable "backend_port" {
  type = number
}

variable "frontend_ip" {
  type = string
}

variable "probe_id" {
  type = string
}

variable "backend_address_pool_ids" {
  type = string
}