# Configure Google Cloud provider
provider "google" {
  region = var.region
}

# Call module to create the project
module "project" {
  source = "./modules/Project"
}