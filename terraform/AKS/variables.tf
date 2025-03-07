variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "middleware-rg"
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
  default     = "middlewareacr"
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
  default     = "middleware-aks"
}

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 3
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "middleware-vnet"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "middleware-subnet"
}

variable "address_space" {
  description = "Virtual network address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  description = "Subnet address prefix"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "database_name" {
  description = "SonarQube database name"
  type        = string
  default     = "sonarqube-db"
}

variable "admin_username" {
  description = "Database admin username"
  type        = string
}

variable "admin_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}
