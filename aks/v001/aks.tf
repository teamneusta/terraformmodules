resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.resource_name
  resource_group_name = local.resource_group_name
  location            = local.location
  dns_prefix          = local.resource_name_prefix
  kubernetes_version  = var.kubernetes_version
  node_resource_group = var.node_resource_group_name != null ? var.node_resource_group_name : "${local.resource_name}_nodes"

  lifecycle {
    ignore_changes = [
      kubernetes_version,
      default_node_pool[0].enable_auto_scaling,
      default_node_pool[0].node_count,
      default_node_pool[0].min_count,
      default_node_pool[0].max_count,
      linux_profile,
      windows_profile
    ]
  }

  role_based_access_control {
    enabled = true
  }

  dynamic "linux_profile" {
    for_each = var.admin_ssh_public_key != null && var.admin_username != "" ? [""] : []
    content {
      admin_username = var.admin_username
      ssh_key {
        key_data = var.admin_ssh_public_key
      }
    }
  }

  dynamic "windows_profile" {
    for_each = var.admin_password != null && var.admin_username != "" ? [""] : []
    content {
      admin_username = var.admin_username
      admin_password = var.admin_password
    }
  }

  tags = var.tags

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.node_size
    os_disk_size_gb = var.disk_size_gb
    max_pods        = var.max_pods_per_node
    type            = "VirtualMachineScaleSets"
    vnet_subnet_id  = var.subnet.id
    node_labels     = var.node_labels
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    docker_bridge_cidr = "172.17.0.1/16"
    dns_service_ip     = "10.254.0.10"
    service_cidr       = "10.254.0.0/16"
    outbound_type      = "loadBalancer"
    load_balancer_sku  = "Standard"
  }

  addon_profile {
    kube_dashboard {
      enabled = false
    }
    dynamic "oms_agent" {
      for_each = var.log_analytics != null ? [""] : []
      content {
        enabled                    = true
        log_analytics_workspace_id = var.log_analytics.id
      }
    }
  }

  dynamic "service_principal" {
    for_each = var.service_principal != null ? [1] : []
    content {
      client_id     = var.service_principal.client_id
      client_secret = var.service_principal.client_secret
    }
  }

  identity {
    type = "SystemAssigned"
  }
}
