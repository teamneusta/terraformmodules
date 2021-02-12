# Create a random password as client secret
resource "random_password" "admin" {
  keepers = {
    location            = local.location
    project_name        = local.project_name
    stage_name          = local.stage_name
    resource_group_name = local.resource_group_name
    resource_name       = local.resource_name
    computer_name       = local.computer_name
    admin_username      = var.admin_username
  }
  length = 32
}