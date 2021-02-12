output "result" {
  value = azurerm_kubernetes_cluster.aks
}

output "id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "data" {
  value = {
    id                       = azurerm_kubernetes_cluster.aks.id
    name                     = azurerm_kubernetes_cluster.aks.name
    fqdn                     = azurerm_kubernetes_cluster.aks.fqdn
    identity                 = azurerm_kubernetes_cluster.aks.identity
    node_resource_group_name = azurerm_kubernetes_cluster.aks.node_resource_group
  }
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config
}

output "kube_config_raw" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

