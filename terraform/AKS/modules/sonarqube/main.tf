resource "azurerm_postgresql_server" "sonarqube_db" {
  name                              = var.database_name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  sku_name                          = "GP_Gen5_2"
  storage_mb                        = 5120
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  administrator_login               = var.admin_username
  administrator_login_password      = var.admin_password
  version                           = "11"
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
}

resource "azurerm_postgresql_database" "sonarqube_db" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.sonarqube_db.name
  charset             = "UTF8"
  collation           = "en_US.utf8"
}

resource "kubernetes_persistent_volume_claim" "sonarqube_pvc" {
  metadata {
    name = "sonarqube-pvc"
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }

  depends_on = [module.aks]

}
