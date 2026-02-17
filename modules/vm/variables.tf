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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  description = "Boot disk configuration (Debian 12 image)"
}

=======
  description = "Boot disk configuration"
}
>>>>>>> Stashed changes
=======
  description = "Boot disk configuration"
}
>>>>>>> Stashed changes
