resource "azurerm_resource_group" "middleware_rg" {
  name     = "middleware-rg"
  location = "East US"
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.middleware_rg.name
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.middleware_rg.name
  vnet_id             = module.network.vnet_id
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.middleware_rg.name
}

module "sonarqube" {
  source              = "./modules/sonarqube"
  resource_group_name = azurerm_resource_group.middleware_rg.name
}
