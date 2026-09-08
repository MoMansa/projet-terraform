resource "google_service_account" "web" {
  account_id   = "${var.prefix}-web-sa"
  display_name = "Compte de service dédié aux machines web"
}
