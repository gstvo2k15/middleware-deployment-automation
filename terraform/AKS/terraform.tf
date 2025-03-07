terraform {
  required_version = "= 1.8.1"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100.0"
    }
    random = {
      version = "~> 3.1.0"
    }
    null = {
      version = "~> 3.1.0"
    }
    ansible = {
      source  = "ansible/ansible"
      version = "1.3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "middleware-rg"
    storage_account_name = "middlewaretfstate"
    container_name       = "tfstate"
    key                  = "aks.tfstate"
  }
}
