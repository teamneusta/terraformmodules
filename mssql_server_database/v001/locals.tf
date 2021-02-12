locals {
  location            = var.location != "*" ? var.location : var.environment.location
  project_name        = var.project_name != "*" ? var.project_name : var.environment.project_name
  stage_name          = var.stage_name != "*" ? var.stage_name : var.environment.stage_name
  resource_group_name = var.resource_group_name != "*" ? var.resource_group_name : var.environment.resource_group_name

  server_name                   = var.server_name != "" ? substr("${local.resource_name_prefix}-${var.server_name}", 0, 24) : var.resource_name != "" ? var.resource_name : random_string.defaultname[0].result
  server_administrator_password = var.server_administrator_password != "" ? var.server_administrator_password : random_password.sql_server_password[0].result

  resource_name_prefix = trim("${local.project_name}-${local.stage_name}", "-")
  resource_name        = var.resource_name != "" ? var.resource_name : local.server_name
}