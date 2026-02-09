# Create a service account for loading data on the virtual machine
resource "google_service_account" "vm_data_loader" {
  account_id = var.account_id_data_loader
  display_name = "vm-data-loader"
  project = var.project_id
}

# Create a service account for creating virtual machines
resource "google_service_account" "vm_creator" {
  account_id = var.account_id_creator
  display_name = "vm-creator"
  project = var.project_id
}

# Assign roles to the service account vm data loader
resource "google_project_iam_member" "vm_data_loader_roles" {
  for_each = toset(var.roles_data_loader)
  member  = "serviceAccount:${google_service_account.vm_data_loader.email}"
  project = var.project_id
  role    = each.value
}

# Assign roles to the service account vm creator
resource "google_project_iam_member" "vm_creator_roles" {
  for_each = toset(var.roles_vm_creator)
  member  = "serviceAccount:${google_service_account.vm_creator.email}"
  project = var.project_id
  role    = each.value
}
