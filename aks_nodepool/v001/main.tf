resource "azurerm_kubernetes_cluster_node_pool" "main" {
  kubernetes_cluster_id = var.aks.id
  name                  = var.pool_name

  lifecycle {
    ignore_changes = [
      enable_auto_scaling,
      node_count,
      min_count,
      max_count
    ]
  }

  node_count      = var.node_count
  vm_size         = var.node_size
  os_disk_size_gb = var.disk_size_gb
  os_type         = var.os_type
  max_pods        = var.max_pods_per_node
  vnet_subnet_id  = var.subnet.id
  node_labels     = var.node_labels

  tags = var.tags
}
