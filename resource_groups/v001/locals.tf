locals {
  location     = var.location != "*" ? var.location : var.environment.location
  project_name = var.project_name != "*" ? var.project_name : var.environment.project_name

  resource_name_prefix = local.project_name
}
