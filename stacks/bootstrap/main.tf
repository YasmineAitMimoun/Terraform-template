# Configure Google Cloud provider
provider "google" {
  region = var.region
}
##################################### Main project ##################################

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

# Assign roles to my user to create service account vm data loader
resource "google_project_iam_member" "user_roles_project_lvl" {
  for_each = toset(var.user_roles_on_project)
  member  = var.user_email
  project = var.project_id
  role    = each.value
  depends_on = [module.create_project]
}

#Call module to create service account responsible for loading data
module "create_service_account_data_loader" {
  source = "../../modules/principals"
  project_id = var.project_id
  service_account_id = var.service_account_id_data_loader
  roles_service_account = var.roles_service_account_data_loader
  depends_on = [google_project_iam_member.user_roles_project_lvl]
}

#Call module to create service account responsible for creating infra
module "create_service_account_infra_creator" {
  source = "../../modules/principals"
  project_id = var.project_id
  service_account_id = var.service_account_id_infra_creator
  roles_service_account = var.roles_service_account_infra_creator
  depends_on = [google_project_iam_member.user_roles_project_lvl]
}

# Assign role to the user for impersonation
resource "google_service_account_iam_member" "user_token_creator" {
  service_account_id = module.create_service_account_infra_creator.service_account_id
  role               = var.token_creator_role_impersonation
  member             = var.user_email
  depends_on = [module.create_service_account_infra_creator]
}

##################################### Project for state backend ##################################


# Call module to create the project
module "create_project_backend" {
  source = "../../modules/project"
  folder_name = var.folder_name
  billing_account = var.billing_account
  organisation_id = var.organisation_id
  project_id = var.project_id_backend
  project_name = var.project_name_backend
  service_to_enable = var.service_to_enable_backend_tf
}

# Assign roles to my user to create service account on this project
resource "google_project_iam_member" "user_roles_project_lvl_backend" {
  for_each = toset(var.user_roles_on_project)
  member  = var.user_email
  project = var.project_id_backend
  role    = each.value
  depends_on = [module.create_project_backend]
}

#Call module to create Service account responsible for managing the state
module "create_service_account_storage" {
  source = "../../modules/principals"
  project_id = var.project_id_backend
  service_account_id = var.service_account_id_state_manager
  roles_service_account = var.roles_service_account_state_manager
  depends_on = [google_project_iam_member.user_roles_project_lvl_backend]
}

#Assign token creator role to the SA creator on the SA storage for impersonation
resource "google_service_account_iam_member" "SA_token_creator" {
  service_account_id = module.create_service_account_storage.service_account_id
  role               = var.token_creator_role_impersonation
  member             = module.create_service_account_infra_creator.service_account_email
  depends_on = [module.create_service_account_storage]
}

#Create storage bucket in the backend project
module "Storage_bucket" {
  source = "../../modules/bucket"
  project_id = var.project_id_backend
  bucket_name = var.bucket_name
}