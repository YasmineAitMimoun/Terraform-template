resource "google_storage_bucket" "CS_bucket" {
  location = "EU"
  name     = var.bucket_name
  project = var.project_id
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

}

