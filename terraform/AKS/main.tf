module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.cluster_name
  node_count          = var.node_count
  vm_size             = var.vm_size
  subnet_id           = var.subnet_id != "" ? var.subnet_id : output.subnet_id_computed
  tenant_id           = var.tenant_id
  client_id           = var.client_id
}

data "azurerm_subnet" "aks_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  acr_name            = var.acr_name
}

module "sonarqube" {
  source              = "./modules/sonarqube"
  resource_group_name = var.resource_group_name
  location            = var.location
  database_name       = var.database_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  aks_cluster_id      = module.aks.cluster_id
}
