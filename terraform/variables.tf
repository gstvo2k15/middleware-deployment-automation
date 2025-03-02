variable "auth_url" {
  description = "Main openstack GUI url"
  type        = string
  default     = "https://openstacklab.duckdns.org:5000/v3/"
}

variable "region" {
  description = "Main openstack GUI url"
  type        = string
  default     = "microstack"
}

variable "purpose" {
  description = "Purpose of the VPC (e.g., dev, prod)"
  type        = string
  default     = "middleware"
}

variable "network_prefix" {
  description = "Base CIDR for the VPC subnet"
  type        = string
  default     = "10.0.1.0"
}

variable "endpoint_type" {
  type    = string
  default = "public"
}

variable "tenant_name" {
  type    = string
  default = "admin"
}

variable "password" {}
