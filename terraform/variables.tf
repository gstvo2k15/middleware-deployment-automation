variable "auth_url" {
  description = "Main openstack GUI url"
  type        = string
  default     = "https://openstack.ubuntu22vm1.duckdns.org:5000/v3"
}
variable "tenant_name" {}
variable "user_name" {}
variable "password" {}
variable "region" {
  default = "RegionOne"
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
