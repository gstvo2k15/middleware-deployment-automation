variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "address_space" {
  description = "Virtual network address space"
  type        = list(string)
}

variable "subnet_prefix" {
  description = "Subnet address prefix"
  type        = list(string)
}

variable "vnet_id" {
  description = "Virtual network ID for AKS"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for AKS"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}
