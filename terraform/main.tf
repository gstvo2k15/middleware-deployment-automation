resource "openstack_compute_instance_v2" "k8s_master" {
  name            = "k8s-master"
  image_name      = "Ubuntu-22.04"
  flavor_name     = "m1.medium"
  key_pair        = "my-key"
  security_groups = ["default"]

  network {
    name = openstack_networking_network_v2.vpc.name
  }
}
