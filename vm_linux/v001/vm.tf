# Create a Linux/Ubuntu virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = local.resource_name
  location                        = local.location
  resource_group_name             = local.resource_group_name
  network_interface_ids           = concat([var.primary_network_interface.id], var.additional_network_interfaces.*.id)
  size                            = var.vm_size
  admin_username                  = var.admin_username
  disable_password_authentication = true
  computer_name                   = local.computer_name
  availability_set_id             = var.availability_set != null ? var.availability_set.id : null

  lifecycle {
    ignore_changes = [
      size,
      os_disk,
      source_image_reference,
      tags,
      admin_username,
      admin_ssh_key,
      disable_password_authentication
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

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  provision_vm_agent = var.provision_vm_agent

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
      InitialAdminLogin = var.admin_username
  })
}
