# Grant Owner access to subscription
resource "azurerm_role_assignment" "subscription_access" {
  count = var.grant_subscription_owner_access ? 1 : 0

  scope              = data.azurerm_subscription.current.id
  principal_id       = azurerm_kubernetes_cluster.aks.identity[count.index].principal_id
  role_definition_id = data.azurerm_role_definition.owner.id
}

# Grant Owner access to resource group
resource "azurerm_role_assignment" "resource_group_access" {
  count = var.grant_resource_group_owner_access ? 1 : 0

  scope              = data.azurerm_resource_group.current.id
  principal_id       = azurerm_kubernetes_cluster.aks.identity[count.index].principal_id
  role_definition_id = data.azurerm_role_definition.owner.id
}

# Grant Network Contributor access to virtual network subnet
resource "azurerm_role_assignment" "subnet_access" {
  count = !var.grant_subscription_owner_access ? 1 : 0

  scope              = var.subnet.id
  principal_id       = azurerm_kubernetes_cluster.aks.identity[count.index].principal_id
  role_definition_id = data.azurerm_role_definition.network_contributor.id
}

# Grant AcrPull role to registry to kubelet identity
resource "azurerm_role_assignment" "acrpull_access" {
  count = var.container_registry != null ? 1 : 0

  scope              = var.container_registry.id
  principal_id       = azurerm_kubernetes_cluster.aks.kubelet_identity[count.index].object_id
  role_definition_id = data.azurerm_role_definition.acrpull.id
}
