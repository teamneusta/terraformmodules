variable "backup_policy" {
  type = object({
    resource_group_name = string
    vault_name          = string
    policy_name         = string
    policy_id           = string
  })
}

variable "vm" {
  type = object({
    id = string
  })
}

