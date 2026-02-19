# Output the ID of the folder created in the organization
output "folder_id" {
  value = google_folder.folder_template.id
}

# Output the display name of the folder
output "folder_display_name" {
  value = google_folder.folder_template.display_name
}

# Output the parent organization ID of the folder
output "folder_parent_id" {
  value = google_folder.folder_template.parent
}