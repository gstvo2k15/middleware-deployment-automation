terraform {
  required_version = "= 1.8.1"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.0"
    }
    random = {
      version = "~> 3.1.0"
    }
    null = {
      version = "~> 3.1.0"
    }
    ansible = {
      source  = "ansible/ansible"
      version = "1.3.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}
