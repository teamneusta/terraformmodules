locals {
  location     = var.location != "*" ? var.location : var.environment.location
  project_name = var.project_name != "*" ? var.project_name : var.environment.project_name

  resource_group_name = "${local.project_name}-${var.resource_group_name}"

  resource_group_names = [var.resource_group_name]
}
