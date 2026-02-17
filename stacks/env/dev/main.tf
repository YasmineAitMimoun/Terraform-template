# Configure Google Cloud provider
provider "google" {
  region = var.region #default region
  zone = var.zone #default zone
  impersonate_service_account = var.SA_email_infra_creator
}

# call module to create the VM
module "VM" {
  source = "../../../modules/vm"
  image = var.image
  machine_type = var.machine_type
  project_id = var.project_id
  service_account = var.SA_email_data_loader
  vm_name = var.vm_name
  zone = var.zone

}

module "Storage_bucket" {
  source = "../../../modules/bucket"
  project_id = var.project_id
  bucket_name = var.bucket_name
}