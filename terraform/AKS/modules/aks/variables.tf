variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
}

variable "vnet_id" {
  description = "Virtual network ID for AKS"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
}
