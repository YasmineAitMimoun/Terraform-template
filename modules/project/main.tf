# Create a project inside the folder
resource "google_project" "Project_template" {
  name       = var.project_name
  project_id = var.project_id
  folder_id = var.folder_id
  deletion_policy = "DELETE"
  billing_account = var.billing_account
  lifecycle {
    ignore_changes = [
      billing_account
    ]
  }
}

# Wait for GCP project creation to fully propagate.
resource "time_sleep" "wait_after_project_creation" {
  depends_on      = [google_project.Project_template]
  create_duration = "30s"
}

# Enable specified services/APIs for the project
resource "google_project_service" "Enable_Services" {
  for_each = toset(var.service_to_enable)
  project = var.project_id
  service = each.value
  depends_on = [time_sleep.wait_after_project_creation]
}
