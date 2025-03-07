resource "azurerm_kubernetes_cluster_node_pool" "aks_nodes" {
  name                  = "mdwpool01"
  kubernetes_cluster_id = module.aks.cluster_id
  vm_size               = "Standard_D2s_v3"
  node_count            = 3
}
