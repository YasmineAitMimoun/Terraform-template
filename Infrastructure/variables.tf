# Specify the region where resources will be created
variable "region" {
  type = string
  description = "Region where the project will be hosted (Belgium)"
  default ="europe-west1"
}

# Specify the zone where resources will be created
variable zone {
  type = string
  description = "Zone where the project will be hosted"
  default ="europe-west1-b"
}

variable service_account {
  default = "vm-creator@myecosystemdevv.iam.gserviceaccount.com"
}