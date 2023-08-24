resource "azurerm_resource_group" "rg_01" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_network_security_group" "nsg01" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "vnet01" {
  name                = var.vnet-01
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers

resource "azurerm_subnet" "subnet_01" {
    name           = var.subnet_name1
    address_prefix = var.address_prefix
  }

resource "azurerm_subnet" "subnet_02" {
    name           = var.subnet_name2
    address_prefix = var.address_prefix
    security_group = azurerm_network_security_group.nsg01.id

  tags = {
    environment = "Production"
  }
}