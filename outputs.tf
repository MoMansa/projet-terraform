output "web_public_ips" {
  description = "Adresses IP publiques des machines web"
  value       = { for k, v in google_compute_instance.web : k => v.network_interface[0].access_config[0].nat_ip }
}

output "artifacts_bucket_name" {
  description = "Nom du bucket d'artefacts"
  value       = google_storage_bucket.artifacts.name
}

output "web_service_account_email" {
  description = "Adresse e-mail du compte de service porté par les machines web"
  value       = google_service_account.web.email
}
