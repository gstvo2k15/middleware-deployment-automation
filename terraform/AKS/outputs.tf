output "aks_cluster_id" {
  value = module.aks.cluster_id
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.network.vnet_id
}
