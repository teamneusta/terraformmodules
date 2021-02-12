data "azurerm_storage_account_sas" "diagnostics_storage" {
  connection_string = var.diagnostics_storage.primary_connection_string
  https_only        = true

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = true
    file  = false
  }

  start  = "2020-01-01"
  expiry = "2199-12-31"

  permissions {
    read    = false
    write   = true
    delete  = false
    list    = true
    add     = true
    create  = true
    update  = true
    process = false
  }
}