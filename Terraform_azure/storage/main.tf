resource "azurerm_resource_group" "RG_01" {
  name     = var.rg_name
  location = var.location
}


resource "azurerm_storage_account" "storage_01" {
  name                     = var.storage_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = "staging"
  }
}