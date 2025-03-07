resource "azurerm_container_registry" "acr" {
  name                = "middlewareacr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
