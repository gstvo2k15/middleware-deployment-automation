output "acr_login_server" {
  description = "Login server for the ACR"
  value       = azurerm_container_registry.acr.login_server
}
