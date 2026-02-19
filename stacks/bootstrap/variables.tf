variable "region" {
  type = string
  default ="europe-west1"
  description = "region of the project"
}
# Organization ID where the folder and project will be created
variable "organisation_id" {
  type = string
  description = "Organization ID"
}

# Folder Name
variable "folder_name" {
  type = string
  description = "Folder Name"
}

variable "user_email" {
  type = string
  description = "email user for impersonation"
}

# User rôle for impersonation
variable "token_creator_role_impersonation" {
  type = string
  description = "Roles to assign to the user for impersonation on the SA (token creator)"
}

variable "billing_account" {
  description = "Billing account GCP pour le projet"
  type        = string
}

###################################### Main project #######################################

variable "project_id" {
  type = string
  description = "Project id"
}

variable "service_account_id_data_loader" {
  type = string
  description = "ID to assign to the service account "
}

variable "service_account_id_infra_creator" {
  type = string
  description = "ID to assign to the service account "
}

# Roles to assign to the service account responsible for loading data
variable "roles_service_account_data_loader"{
  type = list(string)
  description = "Roles to assign to the service account "
}

# Roles to assign to the service account responsible for creating infrastructures
variable "roles_service_account_infra_creator"{
  type = list(string)
  description = "Roles to assign to the service account "
}

# List of Google Cloud services to enable for the project
variable "service_to_enable" {
  type = list(string)
  description = "List of Google Cloud services to enable for the project"
}

# Project Name
variable "project_name" {
  type = string
  description = "Project name"
}

variable "user_roles_on_project" {
  type = list(string)
  description = "Roles to assign to my user to create service accounts"
}

############################## Project for backend state ##############################


variable "project_id_backend" {
  type = string
  description = "Project id"
}

# Project Name
variable "project_name_backend" {
  type = string
  description = "Project name"
}

variable "service_account_id_state_manager" {
  type = string
  description = "ID to assign to the service account "
}

# Roles to assign to the service account responsible for loading data
variable "roles_service_account_state_manager"{
  type = list(string)
  description = "Roles to assign to the service account "
}

# List of Google Cloud services to enable for the project
variable "service_to_enable_backend_tf" {
  type = list(string)
  description = "List of Google Cloud services to enable for the project"
}

#Bucket name
variable "bucket_name" {
  type = string
  description = "unique name of the bucket"
}