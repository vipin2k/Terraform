terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.24.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG_02" {
  name     = "RG-02"
  location = "West Europe"
}

resource "azurerm_network_security_group" "nsg_01" {
  name                = "nsg-01"
  location            = "West Europe"
  resource_group_name = "RG-02"
}

resource "azurerm_virtual_network" "vnet_01" {
  name                = "vnet-01"
  location            = "West Europe"
  resource_group_name = "RG-02"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg_01.id
  }

  tags = {
    environment = "Production"
  }
}