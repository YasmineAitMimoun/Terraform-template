provider "google" {
  #default region and zone
  region = var.region
  zone = var.zone
}

module "service_account" {
  source = "./modules/principals"
}