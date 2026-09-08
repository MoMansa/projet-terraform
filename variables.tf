variable "project_id" {
  description = "Identifiant du projet Google Cloud de formation"
  type        = string
}

variable "region" {
  description = "Région Google Cloud imposée pour toutes les ressources"
  type        = string
  default     = "europe-west1"
}

variable "prefix" {
  description = "Préfixe de nommage unique construit à partir des initiales (minuscules, sans accent, sans underscore)"
  type        = string
}
