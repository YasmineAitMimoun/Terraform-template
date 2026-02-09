# Configure Google Cloud provider
provider "google" {
  region = var.region #default region
  zone = var.zone #default zone
  impersonate_service_account = "vm-creator@myecosystemdevbis.iam.gserviceaccount.com"
}

# call module to create the VM
module "VM" {
  source = "./modules/vm"
}