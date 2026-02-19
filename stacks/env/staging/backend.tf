terraform {
  backend "gcs" {
    bucket  = "backend-tf-bucket"
    prefix  = "staging"
  }
}
