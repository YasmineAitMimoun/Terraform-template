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

# Output the ID of the project created inside the folder
output "project_id" {
  value = google_project.Project_template.id
}

# Output the project name
output "project_name" {
  value = google_project.Project_template.name
}

# Output the project numeric/project number
output "project_number" {
  value  = google_project.Project_template.number
}
