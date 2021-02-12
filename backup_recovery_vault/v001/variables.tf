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
  description = "The name of the resource, overwrites convention-generated name"
  type        = string
  default     = ""
}

variable "vault_name" {
  description = "The name of the vault"
  type        = string
  default     = ""
}

variable "vault_sku" {
  description = "The SKU, defaults to Standard."
  type        = string
  default     = "Standard"
}

variable "soft_delete_enabled" {
  description = "Is soft delete enabled for this vault, defaults to true."
  type        = bool
  default     = true
}

variable "tags" {
  type    = map(any)
  default = {}
}
