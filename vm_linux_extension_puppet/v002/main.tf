resource "azurerm_virtual_machine_extension" "vm_puppetAgent" {
  name                       = "puppet-agent.sh"
  virtual_machine_id         = var.vm.id
  publisher                  = "Microsoft.Azure.Extensions"
  type                       = "CustomScript"
  type_handler_version       = "2.0"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "script": "${base64encode(data.template_file.config.rendered)}"
    }
SETTINGS
}
