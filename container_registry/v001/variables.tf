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

variable "identities_acrpull" {
  description = "The identities that should get AcrPull access"
  type = list(object({
    id        = string
    object_id = string
  }))
  default = []
}

variable "registry_name" {
  description = "The name of the container registry"
  type        = string
  default     = ""
}

variable "registry_sku" {
  description = "The SKU, defaults to Basic"
  type        = string
  default     = "Basic"
}

variable "registry_admin_enabled" {
  description = "A value indicating if admin access should be enabled"
  type        = bool
  default     = true
}
