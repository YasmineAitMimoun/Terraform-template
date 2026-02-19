# Create a folder in the organization
resource "google_folder" "folder_template" {
  display_name = var.folder_name
  parent = var.organisation_id
  deletion_protection = false
}