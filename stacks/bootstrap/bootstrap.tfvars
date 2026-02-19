organisation_id = "organizations/454317965945"
folder_name = "Folder_template"
user_roles_on_project = [
  "roles/iam.serviceAccountAdmin"
    ]
token_creator_role_impersonation = "roles/iam.serviceAccountTokenCreator"

###################################### Main project #######################################
project_id = "projecttemplate2019"
project_name = "ProjectTemplate"
service_account_id_data_loader = "vm-data-loader"
service_account_id_infra_creator = "infra-creator"
roles_service_account_data_loader = [
    "roles/bigquery.dataViewer",
    "roles/bigquery.jobUser",
    "roles/storage.bucketViewer"
  ]
roles_service_account_infra_creator = [
    "roles/compute.instanceAdmin.v1",
    "roles/iam.serviceAccountUser",
    "roles/storage.admin"
  ]
service_to_enable = [
    "compute.googleapis.com",
    "bigquery.googleapis.com",
    "storage.googleapis.com"
  ]

##################################### Project for backend state ##############################

project_id_backend = "projecttemplate2029-backend-tf"
project_name_backend = "ProjectTemplate-backend-tf"
service_account_id_state_manager = "state-manager"
roles_service_account_state_manager = [
    "roles/storage.admin"
  ]
service_to_enable_backend_tf = [
    "storage.googleapis.com"
  ]
bucket_name = "backend-tf-bucket"