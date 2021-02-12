variable "environment" {
  description = "The env module"
  type        = map(any)
  default     = {}
}

variable "key_vault" {
  description = "Specifies the key vault"
  type = object({
    id = string
  })
}

variable "identity" {
  type = object({
    object_id = string
  })
}

variable "key_permissions" {
  description = "List of key permissions"
  type        = list(string)
  default     = ["get"]
}

variable "secret_permissions" {
  description = "List of secret permissions"
  type        = list(string)
  default     = ["get"]
}

variable "certificate_permissions" {
  description = "List of certificate permissions"
  type        = list(string)
  default     = ["get"]
}

variable "storage_permissions" {
  description = "List of storage permissions"
  type        = list(string)
  default     = []
}