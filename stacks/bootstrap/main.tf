# Configure Google Cloud provider
provider "google" {
  region = var.region
}

# Call module to create the project
module "create_project" {
  source = "../../modules/project"
  folder_name = var.folder_name
  billing_account = var.billing_account
  organisation_id = var.organisation_id
  project_id = var.project_id
  project_name = var.project_name
  service_to_enable = var.service_to_enable
}

#Call module to create Service account
module "create_service_account" {
  source = "../../modules/principals"
  project_id = var.project_id
  account_id_data_loader = var.account_id_data_loader
  account_id_creator = var.account_id_creator
  roles_data_loader = var.roles_data_loader
  roles_infra_creator = var.roles_infra_creator
  user_email = var.user_email
  user_role_on_service_account = var.user_role_on_service_account
  user_roles_on_project = var.user_roles_on_project
  depends_on = [module.create_project]
}