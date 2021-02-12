output "result" {
  value = azurerm_kubernetes_cluster_node_pool.main
}

output "id" {
  value = azurerm_kubernetes_cluster_node_pool.main.id
}

output "data" {
  value = {
    id = azurerm_kubernetes_cluster_node_pool.main.id
  }
}
