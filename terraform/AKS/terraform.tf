terraform {
  backend "azurerm" {
    resource_group_name  = "middleware-rg"
    storage_account_name = "middlewaretfstate"
    container_name       = "tfstate"
    key                  = "aks.tfstate"
  }
}
