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
  machine_type = var.machine_type
  project_id = var.project_id
  service_account = var.service_account
  vm_name = var.vm_name
  zone = var.zone

}

module "Storage_bucket" {
  source = "../../modules/bucket"
  project_id = var.project_id
  bucket_name = var.bucket_name
}