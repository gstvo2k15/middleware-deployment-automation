resource "openstack_compute_instance_v2" "vm" {
  name            = "k8s-master"
  image_name      = "Ubuntu-22.04"
  flavor_name     = "m1.medium"
  key_pair        = openstack_compute_keypair_v2.ssh_key.name
  security_groups = ["default"]

  network {
    name = openstack_networking_network_v2.vpc.name
  }
}

resource "openstack_compute_keypair_v2" "ssh_key" {
  name       = "middleware-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
