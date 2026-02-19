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
