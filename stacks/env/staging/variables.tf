# Project ID where the VM will be created
variable "project_id" {
  type = string
  description = "Project ID where the VM will be created"
}

# Boot disk configuration (Debian 12 image)
variable "image" {
  type = string
  description = "Boot disk configuration (Debian 12 image)"
}

# Specify the region where resources will be created
variable "region" {
  type = string
  description = "Region where the project will be hosted (Belgium)"
}

# Specify the zone where resources will be created
variable zone {
  type = string
  description = "Zone where the project will be hosted"
}

# Specify the service account
variable SA_email_data_loader {
  type = string
  description = "Service account email"
}

# Specify the service account
variable SA_email_infra_creator {
  type = string
  description = "Service account email"
}

# Specify the machine type for the VM
variable machine_type {
  type = string
  description = "Machine type of the VM"
}

# Virtual machine name
variable "vm_name" {
  type = string
  description = "Virtual machine name"
}

variable "bucket_name" {
  type = string
  description = "unique name of the bucket"
}