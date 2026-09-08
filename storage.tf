resource "google_storage_bucket" "artifacts" {
  name                        = "${var.prefix}-artifacts-${var.bucket_suffix}"
  location                    = var.region
  force_destroy               = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  labels = var.common_labels
}
