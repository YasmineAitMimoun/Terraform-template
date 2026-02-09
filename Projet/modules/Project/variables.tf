# List of Google Cloud services to enable for the project
variable "service_to_enable" {
  default = [
    "compute.googleapis.com",
    "bigquery.googleapis.com",
    "storage.googleapis.com"
  ]
}

# Organization ID where the folder and project will be created
variable "organisation_id" {
  default = "organizations/454317965945"
}

# Project ID to use for the new Google Cloud project
variable "project_id" {
  default = "uniquemyecosystemdevbis1"
}
