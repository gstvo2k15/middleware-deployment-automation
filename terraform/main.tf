provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "middleware_rg" {
  name     = "middleware-rg"
  location = "East US"
}

# Creación de AKS
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "middleware-aks"
  location            = azurerm_resource_group.middleware_rg.location
  resource_group_name = azurerm_resource_group.middleware_rg.name
  dns_prefix          = "middleware"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }
}

# Creación de Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = "middlewareacr"
  resource_group_name = azurerm_resource_group.middleware_rg.name
  location            = azurerm_resource_group.middleware_rg.location
  sku                 = "Standard"
  admin_enabled       = true
}
