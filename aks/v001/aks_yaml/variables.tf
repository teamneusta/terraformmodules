variable "aks_name" {
  type = string
}

variable "kube_config_raw" {
  type = string
}

variable "checkmkproxy_dns_label" {
  type = string
}

variable "checkmkproxy_image_name" {
  type    = string
  default = "teamneusta/checkmkproxy:latest"
}
