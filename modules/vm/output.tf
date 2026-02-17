# VM instance ID
output "vm_id" {
  value = google_compute_instance.data-loader-vm.id
}

# VM instance name
output "vm_name" {
  value = google_compute_instance.data-loader-vm.name
}

# Machine type of the VM
output "vm_machine_type" {
  value = google_compute_instance.data-loader-vm.machine_type
}

# Project ID where the VM resides
output "vm_project" {
  value = google_compute_instance.data-loader-vm.project
}

# Service account attached to the VM
output "vm_service_account" {
  value = google_compute_instance.data-loader-vm.service_account[0].email
}

# External IP of the VM
output "vm_external_ip" {
  value = google_compute_instance.data-loader-vm.network_interface[0].access_config[0].nat_ip
}

