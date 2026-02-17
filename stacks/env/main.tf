# Configure Google Cloud provider
provider "google" {
  region = var.region #default region
  zone = var.zone #default zone
  impersonate_service_account = var.service_account
}

# call module to create the VM
module "VM" {
  source = "../../modules/vm"
  image = var.image
  project_id = var.project_id
  machine_type = var.machine_type
  service_account = var.service_account
  zone = var.zone
  vm_name = var.vm_name
}

module "Storage_bucket" {
  source = "../../modules/bucket"
  bucket_name = var.bucket_name
  project_id = var.project_id
}