# Output the ID of the folder created in the organization
output "folder_id" {
  value = module.create_project.folder_id
}

# Output the display name of the folder
output "folder_display_name" {
  value = module.create_project.folder_display_name
}

# Output the parent organization ID of the folder
output "folder_parent_id" {
  value = module.create_project.folder_parent_id
}

# Output the ID of the project created inside the folder
output "project_id" {
  value = module.create_project.project_id
}

# Output the project name
output "project_name" {
  value = module.create_project.project_name
}

# Output the project numeric/project number
output "project_number" {
  value  = module.create_project.project_number
}

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