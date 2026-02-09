# ID to assign to the service account
variable "account_id" {
  default = "vm-data-loader"
}

# Roles to assign to the service account
variable "roles"{
  default = [
    "roles/bigquery.dataViewer",
    "roles/bigquery.jobUser"
  ]
}

# Project ID where the service account will be created
variable "project_id" {
  default = "uniquemyecosystemdevbis1"
}
