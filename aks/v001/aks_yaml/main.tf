# Save kube_config
resource "local_file" "kube_config" {
  filename          = "${local.workpath}/.kube.config"
  sensitive_content = var.kube_config_raw
}

data "archive_file" "kustomize_base" {
  type        = "zip"
  source_dir  = local.basepath
  output_path = "${local.workpath}/.base.zip"
}

data "archive_file" "kustomize_overlay" {
  type        = "zip"
  source_dir  = local.overlaypath
  output_path = "${local.workpath}/.overlay.zip"
}

# Generate script to run kustomize as batch script
resource "local_file" "kustomize_cmd" {
  filename = "${local.workpath}/.kustomization.cmd"
  content  = <<EOT
@echo off
cd /d ${replace(local.overlaypath, "/", "\\")}
copy /y *.yaml ${replace(local.workpath, "/", "\\")}
cd /d ${replace(local.workpath, "/", "\\")}
call kustomize edit set image checkmkproxy=${var.checkmkproxy_image_name}
call kustomize edit add configmap source-vars --from-literal CHECKMKPROXY_DNS_LABEL=${var.checkmkproxy_dns_label}
call kustomize build . > output.yaml
call kubectl apply --kubeconfig .kube.config -f output.yaml
EOT
}

# Generate script to run kustomize as bash script
#resource "local_file" "kustomize_sh" {
#  filename = "${local.workpath}/.kustomization.sh"
#  content  = <<EOT
#cd ${local.overlaypath}
#cp *.yaml ${local.workpath}
#cd ${local.workpath}
#kustomize edit set image checkmkproxy=${var.checkmkproxy_image_name}
#kustomize edit add configmap source-vars --from-literal CHECKMKPROXY_DNS_LABEL=${var.checkmkproxy_dns_label}
#kustomize build . > output.yaml
#kubectl apply --kubeconfig .kube.config -f output.yaml
#EOT
#}

# Execute script
resource "null_resource" "kustomize" {
  triggers = {
    base                    = data.archive_file.kustomize_base.output_sha
    overlay                 = data.archive_file.kustomize_overlay.output_sha
    kube_config             = sha1(local_file.kube_config.sensitive_content)
    checkmkproxy_image_name = var.checkmkproxy_image_name
    checkmkproxy_dns_label  = var.checkmkproxy_dns_label
  }

  provisioner "local-exec" {
    command = "call ${local_file.kustomize_cmd.filename}"
  }
}
