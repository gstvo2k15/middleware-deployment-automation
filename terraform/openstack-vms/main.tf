data "openstack_images_image_v2" "ubuntu" {
  name        = "Ubuntu-22.04"
  most_recent = true
}