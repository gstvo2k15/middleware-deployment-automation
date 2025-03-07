resource "azurerm_kubernetes_cluster" "aks" {
  name                = "middleware-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "middleware"

  default_node_pool {
    name           = "default"
    node_count     = 3
    vm_size        = "Standard_D2s_v3"
    vnet_subnet_id = var.vnet_id
  }

  identity {
    type = "SystemAssigned"
  }
}

output "cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}
