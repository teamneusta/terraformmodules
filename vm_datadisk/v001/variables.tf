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

variable "disk_number" {
  type    = number
  default = 0
}

variable "disk_type" {
  type    = string
  default = "Standard_LRS"
}

variable "disk_size_gb" {
  type    = number
  default = 127
}

variable "log_analytics" {
  type = object({
    id                 = string,
    workspace_id       = string,
    primary_shared_key = string
  })
  default = null
}
