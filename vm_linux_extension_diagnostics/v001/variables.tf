variable "vm" {
  type = object({
    id = string
  })
}

variable "diagnostics_storage" {
  type = object({
    name                      = string
    primary_connection_string = string
  })
}

variable "syslog_log_level_config" {
  type        = string
  description = "Syslog Event Configuration log level [Can be LOG_DEBUG, LOG_INFO, LOG_NOTICE, LOG_ERR, LOG_CRIT, LOG_ALERT, LOG_EMERG]"
  default     = "LOG_ERR"
}

variable "enable_extension" {
  type    = bool
  default = true
}
