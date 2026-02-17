# ID to assign to the service account
variable "service_account_id" {
  type = string
  description = "ID to assign to the service account responsible for loading data"
}

# Roles to assign to the service account
variable "roles_service_account"{
  type = list
  description = "Roles to assign to the service account "
}

# Project ID
variable "project_id" {
  type = string
  description = "Project id where the SA will be created"
}