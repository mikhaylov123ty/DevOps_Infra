output "vm_internal_ip" {
  description = "The internal IP address of the virtual machine"
  value       = module.yandex_cloud_vm_instance.ip_address
}

output "vm_external_ip" {
  description = "The external IP address of the virtual machine"
  value       = module.yandex_cloud_vm_instance.public_ip_address
}