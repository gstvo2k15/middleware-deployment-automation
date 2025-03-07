resource "openstack_compute_instance_v2" "vm" {
  name            = "k8s-master"
  image_id        = data.openstack_images_image_v2.ubuntu.id
  flavor_name     = "m1.medium"
  key_pair        = openstack_compute_keypair_v2.ssh_key.name
  security_groups = ["default"]

  block_device {
    source_type           = "image"
    destination_type      = "volume"
    volume_size           = 50
    boot_index            = 0
    delete_on_termination = true
    uuid                  = data.openstack_images_image_v2.ubuntu.id
  }

  network {
    name = openstack_networking_network_v2.vpc.name
  }
}

resource "openstack_compute_keypair_v2" "ssh_key" {
  name       = "middleware-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
