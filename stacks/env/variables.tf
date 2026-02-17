# Specify the region where resources will be created
variable "region" {
  type = string
  description = "Region where the project will be hosted (Belgium)"
  default ="europe-west1"
}

# Specify the zone where resources will be created
variable zone {
  type = string
  description = "Zone where the vm will be located"
}

# Specify the machine type for the VM
variable machine_type {
  type = string
  description = "Machine type of the VM"
}

# Specify the service account for the VM
variable service_account {
  type = string
  description = "Service account email"
}

# Virtual machine name
variable "vm_name" {
  type = string
  description = "Virtual machine name"
}

# Project ID where the VM will be created
variable "project_id" {
  type = string
  description = "Project ID where the VM will be created"
}

# Boot disk configuration (Debian 12 image)
variable "image" {
  type = string
  description = "Boot disk configuration"
}

variable "bucket_name" {
  type = string
  description = "unique name of the bucket"
}