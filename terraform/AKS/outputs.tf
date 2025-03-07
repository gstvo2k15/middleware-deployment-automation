output "vm_name" {
  value = openstack_compute_instance_v2.vm.name
}

output "vm_ip" {
  value = openstack_compute_instance_v2.vm.access_ip_v4
}

output "network_id" {
  value = openstack_networking_network_v2.vpc.id
}

output "subnet_id" {
  value = openstack_networking_subnet_v2.subnet.id
}

output "ssh_key_name" {
  value = openstack_compute_keypair_v2.ssh_key.name
}
