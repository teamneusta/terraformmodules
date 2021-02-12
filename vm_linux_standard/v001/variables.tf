variable "environment" {
  description = "The env module"
  type        = map(any)
  default     = {}
}

variable "location" {
  description = "The location, overwrites environment value"
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

variable "vm_count" {
  type    = number
  default = 1
}

variable "os_disk_type" {
  type    = string
  default = "StandardSSD_LRS"
}

variable "os_disk_size_gb" {
  type    = number
  default = 31
}

variable "os_disk_caching" {
  type    = string
  default = "ReadWrite"
}

variable "admin_username" {
  type    = string
  default = "remoteuser"
}

variable "ssh_public_key" {
  type = string
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

variable "data_disk_type" {
  type    = string
  default = "StandardSSD_LRS"
}

variable "data_disk_sizes_gb" {
  type    = list(number)
  default = []
}

variable "data_disk_caching" {
  type    = string
  default = "ReadOnly"
}

variable "subnet" {
  type = object({
    id = string
  })
}

variable "public_ip_version" {
  type    = string
  default = "IPv4"
}

variable "public_ip_allocation_method" {
  type    = string
  default = "Dynamic"
}

variable "private_ip_address" {
  type    = string
  default = null
}

variable "nsg_open_ports" {
  type = list(object({
    name       = string
    port_range = string
  }))
  default = []
}

variable "nsg_rules" {
  type = list(object({
    priority                     = number
    name                         = string
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_ranges           = list(string)
    destination_port_ranges      = list(string)
    source_address_prefixes      = list(string)
    destination_address_prefixes = list(string)
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
  default = false
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
    id                        = string
    name                      = string
    primary_access_key        = string
    primary_blob_endpoint     = string
    primary_connection_string = string
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

variable "enable_puppet_extension" {
  type    = bool
  default = false
}

variable "provision_vm_agent" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(any)
  default = {}
}
