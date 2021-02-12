output "result" {
  description = "The linux virtual machine resource"
  value       = module.vm.result
}

output "id" {
  description = "The resource ID of the virtual machine"
  value       = module.vm.id
}

output "data" {
  description = "The virtual machine data"
  value       = module.vm.data
}

output "public_ip" {
  description = "The virtual machine data"
  value       = module.public_ip.data
}