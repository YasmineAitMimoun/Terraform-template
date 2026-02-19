# List of Google Cloud services to enable for the project
variable "service_to_enable" {
  type = list
  description = "List of Google Cloud services to enable for the project"
}

# Project ID to use for the new Google Cloud project
variable "project_id" {
  type = string
  description = "Project ID"
}

# Folder id
variable "folder_id" {
  type = string
  description = "Folder id"
}

# Project Name
variable "project_name" {
  type = string
  description = "Project name"
}

variable "billing_account" {
  description = "Billing account GCP pour le projet"
  type        = string
}
