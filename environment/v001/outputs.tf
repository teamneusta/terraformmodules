output "data" {
  description = "The environment variable map"
  value = merge(
    local.defaults,
    var.settings,
    var.parent,
    {
      location            = local.location
      project_name        = local.project_name
      stage_name          = local.stage_name
      resource_group_name = local.resource_group_name
      tenant_id           = data.azurerm_subscription.current.tenant_id
      subscription_id     = data.azurerm_subscription.current.subscription_id
      subscription_name   = data.azurerm_subscription.current.display_name
  })
}

