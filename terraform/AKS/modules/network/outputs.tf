output "subnet_id" {
  description = "Subnet ID for AKS"
  value       = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${var.vnet_name}/subnets/${var.subnet_name}"
}
