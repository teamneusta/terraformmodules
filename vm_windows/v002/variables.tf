variable "environment" {
  description = "The env module"
  type        = map(any)
  default     = {}
}

variable "location" {
  description = "The lLocation, overwrites environment value"
  type        = string
  default     = "*"
}

variable "project_name" {
  description = "The name of the project, overwrites environment value"
  type        = string
  default     = "*"
}

variable "stage_name" {
  description = "The name of the stage, overwrites environment value"
  type        = string
  default     = "*"
}

variable "resource_group_name" {
  description = "The name of the resource group, overwrites environment value"
  type        = string
  default     = "*"
}

variable "resource_name" {
  type    = string
  default = ""
}

variable "vm_name" {
  type    = string
  default = ""
}

variable "vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "os_disk_type" {
  type    = string
  default = "Standard_LRS"
}

variable "os_disk_size_gb" {
  type    = number
  default = 127
}

variable "os_disk_caching" {
  type    = string
  default = "ReadWrite"
}

variable "admin_username" {
  type    = string
  default = "remoteuser"
}

variable "admin_password" {
  type    = string
  default = ""
}

variable "computer_name" {
  type    = string
  default = ""
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = null
}

variable "license_type" {
  type    = string
  default = null
}

variable "data_disks" {
  type = list(object({
    id = string
  }))
  default = []
}

variable "data_disk_caching" {
  type    = string
  default = "ReadOnly"
}

variable "primary_network_interface" {
  type = object({
    id = string
  })
}

variable "additional_network_interfaces" {
  type = list(object({
    id = string
  }))
  default = []
}

variable "user_assigned_identities" {
  type = list(object({
    id = string
  }))
  default = []
}

variable "system_assigned_identity" {
  type    = bool
  default = true
}

variable "availability_set" {
  type = object({
    id = string
  })
  default = null
}

variable "log_analytics" {
  type = object({
    id                 = string
    workspace_id       = string
    primary_shared_key = string
  })
  default = null
}

variable "diagnostics_storage" {
  type = object({
    id                    = string
    name                  = string
    primary_access_key    = string
    primary_blob_endpoint = string
  })
  default = null
}

variable "enable_diagnostics_extension" {
  type    = bool
  default = true
}

variable "enable_omsagent_extension" {
  type    = bool
  default = false
}

variable "enable_antimalware_extension" {
  type    = bool
  default = true
}

variable "enable_nvidiadrivers_extension" {
  type    = bool
  default = false
}

variable "enable_automatic_updates" {
  type    = bool
  default = true
}

variable "provision_vm_agent" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(any)
  default = {}
}
