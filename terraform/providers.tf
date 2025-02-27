provider "openstack" {
  # checkov:skip=CKV_OPENSTACK_1: "Ensure no hard coded OpenStack password, token, or application_credential_secret exists in provider"
  auth_url      = var.auth_url
  region        = var.region
  insecure      = true
  endpoint_type = var.endpoint_type
  tenant_name   = var.tenant_name
  user_name     = var.tenant_name
  password      = nonsensitive(var.password)
}

provider "random" {}
