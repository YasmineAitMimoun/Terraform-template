provider "google" {
  region = var.region
}

module "project" {
  source = "./modules/Project"
}