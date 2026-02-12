organisation_id = "organizations/454317965945"
folder_name = "Folder_template"
project_id = "projecttemplate2022"
project_name = "ProjectTemplate"
account_id_data_loader = "vm-data-loader"
account_id_creator = "infra-creator"
roles_data_loader = [
    "roles/bigquery.dataViewer",
    "roles/bigquery.jobUser",
    "roles/storage.bucketViewer"
  ]
roles_infra_creator = [
    "roles/compute.instanceAdmin.v1",
    "roles/iam.serviceAccountUser",
    "roles/storage.admin"
  ]
user_roles_on_project = [
  "roles/iam.serviceAccountAdmin"
    ]
user_role_on_service_account = "roles/iam.serviceAccountTokenCreator"
service_to_enable = [
    "compute.googleapis.com",
    "bigquery.googleapis.com",
    "storage.googleapis.com"
  ]