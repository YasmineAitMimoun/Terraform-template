# Output the email of the VM data loader service account
output "service_account_email" {
  value = google_service_account.service_account.email
}

# Output the ID of the VM data loader service account
output "service_account_id" {
  value = google_service_account.service_account.id
}
