locals {
  location            = var.location != "*" ? var.location : var.environment.location
  project_name        = var.project_name != "*" ? var.project_name : var.environment.project_name
  stage_name          = var.stage_name != "*" ? var.stage_name : var.environment.stage_name
  resource_group_name = var.resource_group_name != "*" ? var.resource_group_name : var.environment.resource_group_name

  public_ip_name = var.public_ip_name != "" ? "${local.resource_name_prefix}-${var.public_ip_name}" : random_string.defaultname.result

  resource_name_prefix = trim("${local.project_name}-${local.stage_name}", "-")
  resource_name        = var.resource_name != "" ? var.resource_name : local.public_ip_name

  domain_name       = var.domain_name_suffix != "*" ? trim("${local.resource_name_prefix}-${var.domain_name_suffix}", "-") : local.public_ip_name
  domain_name_label = var.domain_name_label != "" ? var.domain_name_label : replace(local.domain_name, "_", "")
}