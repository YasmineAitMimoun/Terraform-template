# Create a service account
resource "google_service_account" "service_account" {
  account_id = var.service_account_id
  project = var.project_id
}


# Assign roles to the service account
resource "google_project_iam_member" "sa_roles" {
  for_each = toset(var.roles_service_account)
  member  = "serviceAccount:${google_service_account.service_account.email}"
  project = var.project_id
  role    = each.value
}


