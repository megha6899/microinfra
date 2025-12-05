output "aks_kube_configs" {
  value = {
    for key, cluster in azurerm_kubernetes_cluster.aks :
    key => cluster.kube_config_raw
  }
  sensitive = true
}

output "aks_client_certificates" {
  value = {
    for key, cluster in azurerm_kubernetes_cluster.aks :
    key => cluster.kube_config[0].client_certificate
  }
  sensitive = true
}
