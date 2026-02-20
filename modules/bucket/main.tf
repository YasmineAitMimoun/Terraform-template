resource "google_storage_bucket" "CS_bucket" {
  location = var.location
  name     = var.bucket_name
  project = var.project_id
  storage_class = var.storage_class
  versioning {
    enabled = true
  }
  uniform_bucket_level_access = true
}