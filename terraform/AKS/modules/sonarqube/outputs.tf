output "sonarqube_db" {
  description = "SonarQube database name"
  value       = azurerm_postgresql_database.sonarqube_db.name
}
