locals {
  instance_indexes = toset([for i in range(var.instance_count) : tostring(i)])
}

resource "google_compute_instance" "web" {
  for_each     = local.instance_indexes
  name         = "${var.prefix}-web-${each.key}"
  machine_type = var.machine_type
  zone         = "${var.region}-b"
  tags         = ["web", "ssh"]
  labels       = var.common_labels

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.main.id
    access_config {}
  }

  service_account {
    email  = google_service_account.web.email
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = file("${path.module}/scripts/startup.sh")
}
