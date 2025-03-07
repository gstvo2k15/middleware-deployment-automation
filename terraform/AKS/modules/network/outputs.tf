output "aks_subnet_id" {
  description = "Subnet ID for AKS"
  value       = azurerm_subnet.aks_subnet.id
}
