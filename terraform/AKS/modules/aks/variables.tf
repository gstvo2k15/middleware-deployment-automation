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

variable "subnet_id" {
  description = "Subnet ID for AKS"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "middleware-vnet"
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
  default     = "middleware-subnet"
}

variable "address_space" {
  description = "VNET Address Space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  description = "Subnet Prefix"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
