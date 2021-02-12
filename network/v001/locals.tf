locals {
  location            = var.location != "*" ? var.location : var.environment.location
  project_name        = var.project_name != "*" ? var.project_name : var.environment.project_name
  stage_name          = var.stage_name != "*" ? var.stage_name : var.environment.stage_name
  resource_group_name = var.resource_group_name != "*" ? var.resource_group_name : var.environment.resource_group_name

  resource_name_prefix = trim("${local.project_name}-${local.stage_name}", "-")

  resource_name = "${local.resource_name_prefix}-network"

  subnet_name_prefix        = trim("${var.include_project_name ? local.project_name : ""}-${var.include_stage_name ? local.stage_name : ""}", "-")
  subnet_name_prefix_length = length(local.subnet_name_prefix) > 0 ? length(local.subnet_name_prefix) + 1 : 0
}
