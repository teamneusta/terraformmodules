locals {
  location            = var.location != "*" ? var.location : var.environment.location
  project_name        = var.project_name != "*" ? var.project_name : var.environment.project_name
  stage_name          = var.stage_name != "*" ? var.stage_name : var.environment.stage_name
  resource_group_name = var.resource_group_name != "*" ? var.resource_group_name : var.environment.resource_group_name

  key_vault_name = var.key_vault_name != "" ? substr(replace("${local.resource_name_prefix}-${var.key_vault_name}", "-", ""), 0, 24) : var.resource_name != "" ? var.resource_name : random_string.defaultname[0].result

  resource_name_prefix = trim("${local.project_name}-${local.stage_name}", "-")
  resource_name        = var.resource_name != "" ? var.resource_name : local.key_vault_name
}