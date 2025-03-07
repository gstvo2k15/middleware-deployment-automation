output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_subnet.aks_subnet.id
}
