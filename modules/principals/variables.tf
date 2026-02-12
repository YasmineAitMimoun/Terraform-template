# ID to assign to the service account responsible for loading data
variable "account_id_data_loader" {
  type = string
  description = "ID to assign to the service account responsible for loading data"
}

# ID to assign to the service account responsible for creating infrastructure
variable "account_id_creator" {
  type = string
  description = "ID to assign to the service account responsible for creating infrastructure"
}

# Roles to assign to the service account responsible for loading data
variable "roles_data_loader"{
  type = list
  description = "Roles to assign to the service account responsible for loading data"
}

# Roles to assign to the service account responsible for creating infrastructure
variable "roles_infra_creator" {
  type = list
  description = "Roles to assign to the service account responsible for creating infrastructure"
}

# Project ID
variable "project_id" {
  type = string
  description = "Project id where the SA will be created"
}

variable "user_email" {
  type = string
  description = "email user for impersonation"
}

# User rôle for impersonation
variable "user_role_on_service_account" {
  type = string
  description = "Roles to assign to the user for impersonation on the SA (token creator)"
}

# Roles to assign to my user to create service accounts
variable "user_roles_on_project" {
  type = list
  description = "Roles to assign to my user to create service accounts"
}