resource "openstack_networking_network_v2" "vpc" {
  name           = "vpc-${var.purpose}"
  admin_state_up = true
}

resource "openstack_networking_subnet_v2" "subnet" {
  name       = "subnet-${var.purpose}"
  network_id = openstack_networking_network_v2.vpc.id
  cidr       = "${var.network_prefix}/24"
}
