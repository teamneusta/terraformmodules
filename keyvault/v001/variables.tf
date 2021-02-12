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
  description = "The name of the resource, overwrites convention-generated name"
  type        = string
  default     = ""
}

variable "key_vault_name" {
  type    = string
  default = ""
}

variable "key_vault_sku" {
  description = "The SKU, defaults to Standard"
  type        = string
  default     = "standard"
}

variable "soft_delete_enabled" {
  type        = bool
  default     = false
  description = "Should Soft Delete be enabled for this Key Vault? Defaults to false."
}

variable "purge_protection_enabled" {
  type        = bool
  default     = false
  description = "Is Purge Protection enabled for this Key Vault? Defaults to false."
}

variable "ip_rules" {
  type    = list(string)
  default = []
}

variable "vnet_rule_subnets" {
  type = list(object({
    id = string
  }))
  default = []
}

variable "allow_public_access" {
  type        = bool
  default     = false
  description = "Should Public Access be allowed? Defaults to false."
}

variable "allow_azure_access" {
  type        = bool
  default     = true
  description = "Should Azure Service Access be allowed for services except the VNet or IP rules? Defaults to false."
}
