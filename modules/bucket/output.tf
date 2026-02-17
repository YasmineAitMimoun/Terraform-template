# Output the name of the bucket
output "bucket_name" {
  value = google_storage_bucket.CS_bucket.name
}

# Output the bucket URL in gs:// format
output "bucket_url" {
  value = "gs://${google_storage_bucket.CS_bucket.name}"
}