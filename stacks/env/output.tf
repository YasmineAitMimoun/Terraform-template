# VM instance ID
output "vm_id" {
  value = module.VM.vm_id
}

# VM instance name
output "vm_name" {
  value = module.VM.vm_name
}

# Machine type of the VM
output "vm_machine_type" {
  value = module.VM.vm_machine_type
}

# Project ID where the VM resides
output "vm_project" {
  value = module.VM.vm_project
}

# Service account attached to the VM
output "vm_service_account" {
  value = module.VM.vm_service_account
}

# External IP of the VM
output "vm_external_ip" {
  value = module.VM.vm_external_ip
}

# Output the name of the bucket
output "bucket_name" {
  value = module.Storage_bucket.bucket_name
}

# Output the bucket URL in gs:// format
output "bucket_url" {
  value = module.Storage_bucket.bucket_url
}