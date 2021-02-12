locals {
  location            = var.location != "*" ? var.location : var.environment.location
  project_name        = var.project_name != "*" ? var.project_name : var.environment.project_name
  stage_name          = var.stage_name != "*" ? var.stage_name : var.environment.stage_name
  resource_group_name = var.resource_group_name != "*" ? var.resource_group_name : var.environment.resource_group_name

  lb_name = coalesce("${local.resource_name_prefix}-${var.lb_name}", random_string.defaultname.result)

  resource_name_prefix = trim("${local.project_name}-${local.stage_name}", "-")
  resource_name        = coalesce(var.resource_name, local.lb_name)
}