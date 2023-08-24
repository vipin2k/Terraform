vm_name      = "app_vm"
location     = "West Europe"
vm_size      = "Standard_DS1_v2"

rg_name     = "RG-01"
vnet   = "vnet-01"
address_space  = ["10.0.0.0/16"]

subnet_name             = "subnet-01"
address_prefixes     = ["10.0.2.0/24"]

network_interface_name  = "app-interface"

disk_name            = "myosdisk1"
managed_disk_type = "Standard_LRS"
caching           = "ReadWrite"
create_option     = "FromImage"

os_profile_name = "hostname"
admin_username = "testadmin"
admin_password = "Password1234!"

ip_name   = "internal"
subnet_id = azurerm_subnet.subnet_01.id
private_ip_address_allocation = "Dynamic"


publisher = "MicrosoftWindowsServer"
offer     = "WindowsServer"
sku       = "2019-Datacenter"
vrsn   = "latest"