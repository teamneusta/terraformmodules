variable "backup_vault" {
  type = object({
    resource_group_name = string,
    vault_name          = string,
  })
}

variable "policy_name" {
  type    = string
  default = "DefaultPolicy"
}
