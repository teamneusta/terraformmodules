module "yaml" {
  source = "./aks_yaml"

  aks_name               = azurerm_kubernetes_cluster.aks.name
  kube_config_raw        = azurerm_kubernetes_cluster.aks.kube_config_raw
  checkmkproxy_dns_label = "${azurerm_kubernetes_cluster.aks.name}-checkmkproxy"
}