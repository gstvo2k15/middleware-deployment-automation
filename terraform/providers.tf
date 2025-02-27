provider "openstack" {
  auth_url    = "https://openstack.ubuntu22vm1.duckdns.org:5000/v3"
  tenant_name = var.tenant_name
  user_name   = var.user_name
  password    = var.password
  region      = var.region
}
