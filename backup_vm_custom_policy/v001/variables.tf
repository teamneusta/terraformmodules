variable "backup_vault" {
  type = object({
    resource_group_name = string,
    vault_name          = string,
  })
}

variable "policy_name" {
  type = string
}

variable "frequency" {
  type        = string
  default     = "Daily"
  description = "Sets the backup frequency. Must be either Daily or Weekly."
}

variable "time" {
  type        = string
  default     = "03:00"
  description = "The time of day to perform the backup in 24 hour format, time zone UTC."
}

variable "weekdays" {
  type        = list(string)
  default     = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  description = "The days of the week to perform backups on. Must be a set of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday."
}

variable "retention_daily" {
  type = object({
    count = number
  })
  default = {
    count = 0
  }
}

variable "retention_weekly" {
  type = object({
    count    = number
    weekdays = list(string)
  })
  default = {
    count    = 0
    weekdays = []
  }
}

variable "retention_monthly" {
  type = object({
    count    = number
    weekdays = list(string)
    weeks    = list(string)
  })
  default = {
    count    = 0
    weekdays = []
    weeks    = []
  }
}

variable "retention_yearly" {
  type = object({
    count    = number
    weekdays = list(string)
    weeks    = list(string)
    months   = list(string)
  })
  default = {
    count    = 0
    weekdays = []
    weeks    = []
    months   = []
  }
}

