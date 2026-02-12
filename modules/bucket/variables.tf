variable "project_id" {
  type = string
  description = "Project id  of the bucket"
}

variable "bucket_name" {
  type = string
  description = "unique name of the bucket"
}

variable "location" {
  type = string
  description = "Location where to store the bucket"
  default = "EU"
}

variable "storage_class" {
  type = string
  description = "Bucket storage class"
  default = "STANDARD"
}