locals {
  basepath    = "${abspath(path.root)}/${path.module}/base"
  overlaypath = "${abspath(path.root)}/${path.module}/overlay"

  workname = "${var.aks_name}_${sha1(var.kube_config_raw)}"
  workpath = "${abspath(path.root)}/${path.module}/work/${local.workname}"
}