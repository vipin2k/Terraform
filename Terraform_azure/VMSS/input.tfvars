rg_name = "RG-01"
location     = "West Europe"

vnet_name   = "vnet01"
address_space       = ["10.0.0.0/16"]

subnet_name             = "subnet01"
address_prefixes     = ["10.0.1.0/24"]

public_ip_name = "load-ip"
allocation_method   = "static"
sku             ="Standard"

lb_name = "app-balancer"
sku="Standard"
sku_tier = "Regional"

front_name      = "frontend-ip"
backend_name            = "scalesetpool"

probe_name = "probeA"
port                = 80
protocol            = "TCP"

Rule_name = "RuleA"
frontend_port          = 80
backend_port            = 80
frontend_ip = "frontend-ip"
probe_id = azurerm_lb_probe.probeA.id