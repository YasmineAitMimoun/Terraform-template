# Configure Google Cloud provider
provider "google" {
  region = var.region #default region
  zone = var.zone #default zone
  impersonate_service_account = var.service_account
}

# call module to create the VM
module "VM" {
  source = "./modules/vm"
}

module "Storage_bucket" {
  source = "./modules/bucket"
}