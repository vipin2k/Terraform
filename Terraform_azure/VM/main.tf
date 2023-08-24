resource "azurerm_resource_group" "RG_01" {
  name     = "RG-01"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet_01" {
  name                = var.vnet
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "subnet_01" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "app_interface" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.rg_name

ip_configuration {
    name                          = var.ip_name
    subnet_id                     = azurerm_subnet.subnet_01.id
    private_ip_address_allocation = "Dynamic"
}    
}
resource "azurerm_virtual_machine" "app_vm" {
  name                  = var.vm_name 
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.app_interface.id]
  vm_size               = var.vm_size

  storage_os_disk {
    name              = var.disk_name 
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }

  os_profile {
    computer_name  = var.os_profile_name
    admin_username = var.admin_username
    admin_password = var.admin_password
}


  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.vrsn
  }

os_profile_windows_config {
  }
  tags = {
    environment = "staging"
  }
}