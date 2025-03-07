resource "azurerm_kubernetes_cluster" "aks" {
  name                = "middleware-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "middleware"

  default_node_pool {
    name           = "default"
    node_count     = 3
    vm_size        = "Standard_D2s_v3"
    vnet_subnet_id = var.subnet_id
  }

  network_profile {
    network_plugin     = "azure"
    service_cidr       = "10.1.0.0/16"
    dns_service_ip     = "10.1.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
  }

  identity {
    type = "SystemAssigned"
  }
}
