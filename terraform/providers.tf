provider "openstack" {
  # checkov:skip=CKV_OPENSTACK_1: "Ensure no hard coded OpenStack password, token, or application_credential_secret exists in provider"
  auth_url    = var.os_url
  tenant_name = var.tenant_name
  user_name   = var.user_name
  password    = nonsensitive(var.password)
  region      = var.region
}

provider "random" {}
