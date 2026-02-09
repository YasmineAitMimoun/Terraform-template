# Configure Google Cloud provider
provider "google" {
  region = var.region #default region
  zone = var.zone #default zone
}

# Call module to create the service account
module "service_account" {
  source = "./modules/principals"
}