resource "google_service_account" "vm_data_loader" {
  account_id = var.account_id
  display_name = "vm-data-loader"
  project = var.project_id
}

resource "google_project_iam_member" "service_account_roles" {
  for_each = toset(var.roles)
  member  = "serviceAccount:${google_service_account.vm_data_loader.email}"
  project = var.project_id
  role    = each.value
}
