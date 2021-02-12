resource "azurerm_storage_account" "storage" {
  name                = local.resource_name
  location            = local.location
  resource_group_name = local.resource_group_name

  account_kind              = var.account_kind
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  access_tier               = var.access_tier
  enable_https_traffic_only = var.enable_https_traffic_only

  identity {
    type = "SystemAssigned"
  }

  dynamic "static_website" {
    for_each = var.enable_static_website ? [1] : []
    content {
      index_document     = "index.html"
      error_404_document = "404.html"
    }
  }

  tags = var.tags
}