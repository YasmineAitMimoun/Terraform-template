# Debian 12 Virtual Machine
resource "google_compute_instance" "data-loader-vm" {
  name = var.vm_name
  machine_type = var.machine_type
  zone = var.zone
  project = var.project_id

  # Boot disk configuration (Debian 12 image)
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  # Network configuration (default VPC with external IP)
  network_interface {
    network       = "default"
    access_config {}
  }
  # Service Account attached to the VM
  # This Service Account will be used by applications running on the VM
  service_account {
    email  = var.service_account
    scopes = ["cloud-platform"]
  }
}