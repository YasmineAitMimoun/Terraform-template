variable "account_id" {
  default = "vm-data-loader"
}

variable "roles"{
  default = [
    "roles/bigquery.dataViewer",
    "roles/bigquery.jobUser"
  ]
}

variable "organisation_id" {
  default = "organizations/454317965945"
}

variable "project_id" {
  default = "uniquemyecosystemdevbis1"
}
