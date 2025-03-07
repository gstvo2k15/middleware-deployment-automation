resource "azurerm_virtual_network" "middleware_vnet" {
  name                = "middleware-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.middleware_vnet.name
  address_prefixes     = var.subnet_prefix
}
