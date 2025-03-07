variable "location" {
  description = "Ubicación de los recursos en Azure"
  default     = "East US"
}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  default     = "middleware-rg"
}

variable "vnet_id" {
  description = "ID de la red virtual"
}
