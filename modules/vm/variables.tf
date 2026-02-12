# Specify the zone where resources will be created
variable zone {
  type = string
  description = "Zone where the project will be hosted"
  default ="europe-west1-b"
}

# Specify the machine type for the VM
variable machine_type {
  type = string
  description = "Machine type of the VM"
  default ="e2-micro"
}

# Specify the service account for the VM
variable service_account {
  type = string
  description = "Service account email"
  default ="vm-data-loader@myecosystemdevv.iam.gserviceaccount.com"
}

# Virtual machine name
variable "vm_name" {
  default = "data-loader-vm"
}

# Project ID where the VM will be created
variable "project_id" {
  default = "myecosystemdevv"
}

# Boot disk configuration (Debian 12 image)
variable "image" {
  default = "debian-cloud/debian-12"
}