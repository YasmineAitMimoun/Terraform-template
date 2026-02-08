variable "service_to_enable" {
  default = [
    "compute.googleapis.com",
    "bigquery.googleapis.com",
    "storage.googleapis.com"
  ]
}

variable "organisation_id" {
  default = "organizations/454317965945"
}

variable "project_id" {
  default = "uniquemyecosystemdevbis1"
}
