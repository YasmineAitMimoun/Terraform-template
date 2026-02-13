# Output the email of the VM data loader service account
output "vm_data_loader_email" {
  value = module.create_service_account_data_loader.service_account_email
}

# Output the ID of the VM data loader service account
output "vm_data_loader_id" {
  value = module.create_service_account_data_loader.service_account_id
}

# Output the email of the infrastructure creator service account
output "infra_creator_email" {
  value = module.create_service_account_infra_creator.service_account_email
}

# Output the ID of the infrastructure creator service account
output "infra_creator_id" {
  value = module.create_service_account_infra_creator.service_account_id
}