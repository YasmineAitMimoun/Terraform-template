resource "google_folder" "folder_template" {
  display_name = "folder_template1"
  parent = var.organisation_id
  deletion_protection = false
}

resource "google_project" "Project_template" {
  name       = "myecosystemdevbis1"
  project_id = var.project_id
  folder_id = google_folder.folder_template.id
  deletion_policy = "DELETE"
}

resource "google_project_service" "Enable_Services" {
  for_each = toset(var.service_to_enable)
  project = var.project_id
  service = each.value
}