# Create a Windows virtual machine
resource "azurerm_windows_virtual_machine" "vm" {
  name                  = local.resource_name
  location              = local.location
  resource_group_name   = local.resource_group_name
  network_interface_ids = concat([var.primary_network_interface.id], var.additional_network_interfaces.*.id)
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = local.admin_password
  computer_name         = local.computer_name
  availability_set_id   = var.availability_set != null ? var.availability_set.id : null

  lifecycle {
    ignore_changes = [
      size,
      os_disk,
      source_image_reference,
      tags,
      admin_username,
      admin_password,
      license_type
    ]
  }

  os_disk {
    name                 = "${local.resource_name}_OsDisk"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_type
    disk_size_gb         = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = coalesce(var.source_image_reference.version, "latest")
  }

  provision_vm_agent       = var.provision_vm_agent
  enable_automatic_updates = var.enable_automatic_updates

  dynamic "identity" {
    for_each = var.system_assigned_identity == false && length(var.user_assigned_identities) != 0 ? [1] : []
    content {
      type         = "UserAssigned"
      identity_ids = var.user_assigned_identities.*.id
    }
  }

  dynamic "identity" {
    for_each = var.system_assigned_identity && length(var.user_assigned_identities) != 0 ? [1] : []
    content {
      type         = "SystemAssigned,UserAssigned"
      identity_ids = var.user_assigned_identities.*.id
    }
  }

  dynamic "identity" {
    for_each = var.system_assigned_identity && length(var.user_assigned_identities) == 0 ? [1] : []
    content {
      type         = "SystemAssigned"
      identity_ids = []
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.diagnostics_storage != null ? [""] : []
    content {
      storage_account_uri = var.diagnostics_storage.primary_blob_endpoint
    }
  }

  tags = merge(
    var.tags,
    {
      InitialAdminLogin    = var.admin_username
      InitialAdminPassword = local.admin_password
  })
}
