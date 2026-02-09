# ID to assign to the service account responsible for loading data
variable "account_id_data_loader" {
  default = "vm-data-loader"
}

# ID to assign to the service account responsible for creating service account
variable "account_id_creator" {
  default = "vm-creator"
}

# Roles to assign to the service account
variable "roles_data_loader"{
  default = [
    "roles/bigquery.dataViewer",
    "roles/bigquery.jobUser",
    "roles/storage.bucketViewer"
  ]
}

# Roles to assign to the service account
variable "roles_vm_creator" {
  default = [
    "roles/compute.instanceAdmin.v1",
    "roles/iam.serviceAccountUser"
  ]
}

# Project ID where the service account will be created
variable "project_id" {
  default = "myecosystemdevbis"
}
