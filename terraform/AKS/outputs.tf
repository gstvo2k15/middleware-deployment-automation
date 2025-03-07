output "aks_cluster_id" {
  value = module.aks.cluster_id
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "sonarqube_db" {
  value = module.sonarqube.sonarqube_db
}
