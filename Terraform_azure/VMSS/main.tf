resource "azurerm_resource_group" "RG_01" {
  name     = "RG-01"
  location = "West Europe"
}

resource "azurerm_virtual_network" "Vnet" {
  name                = var.vnet_name 
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "subnet01" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.location
  address_prefixes     = ["10.0.1.0/24"]
  }

resource "azurerm_public_ip" "load_ip"{
  name                = var.public_ip_name
  location            =  var.location
  resource_group_name = var.rg_name
  allocation_method   = "static"
  sku="Standard"
}

resource "azurerm_lb" "app_balancer" {
  name                   = var.lb_name
  location               = var.location
  resource_group_name    = var.rg_name
  sku="Standard"
  sku_tier = "Regional"
  frontend_ip_configuration {
    name                 = var.front_name
    public_ip_address_id = azurerm_public_ip.load_ip.id 
  }



resource "azurerm_lb_backend_address_pool" "scalesetpool" {
  loadbalancer_id  = azurerm_lb.app_balancer.id
  name            = var.backend_name

}
resource "azurerm_lb_probe" "probeA" {
  resource_group_name = var.rg_name
  loadbalancer_id     = var.loadbalancer_id
  name                = var.probe_name
  port                = var.port
  protocol            = var.protocol
  }

resource "azurerm_lb_rule" "RuleA" {
  resource_group_name   = var.rg_name
  loadbalancer_id     =  var.loadbalancer_id
  name                   = var.Rule_name
  protocol              = var.protocol
  frontend_port          = var.frontend_port
  backend_port            = var.backend_port  
  frontend_ip_configuration = var.frontend_ip
  probe_id                  = var.probe_id
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.scalesetpool.id ]

  }
