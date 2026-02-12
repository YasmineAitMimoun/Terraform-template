# Output the email of the VM data loader service account
output "vm_data_loader_email" {
  value = google_service_account.vm_data_loader.email
}

# Output the ID of the VM data loader service account
output "vm_data_loader_id" {
  value = google_service_account.vm_data_loader.id
}

# Output the email of the infrastructure creator service account
output "infra_creator_email" {
  value = google_service_account.infra_creator.email
}

# Output the ID of the infrastructure creator service account
output "infra_creator_id" {
  value = google_service_account.infra_creator.id
}