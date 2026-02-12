# Configure Google Cloud provider
provider "google" {
  region = var.region
}

# Call module to create the project
module "project" {
  source = "../../../modules/project"
}

#Call module to create Service account
module "service_account" {
  source = "../../../modules/principals"
  project_id = var.project_id
  account_id_data_loader = var.account_id_data_loader
  account_id_creator = var.account_id_creator
  roles_data_loader = var.roles_data_loader
  roles_infra_creator = var.roles_infra_creator
  user_email = var.user_email
  user_role = var.user_role
}