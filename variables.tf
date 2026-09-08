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

variable "subnet_cidr" {
  description = "Plage privée du sous-réseau régional (au moins /24)"
  type        = string
  default     = "10.10.0.0/24"
}

variable "ssh_source_ranges" {
  description = "Plage réservée au service Identity-Aware Proxy pour le tunneling SSH"
  type        = list(string)
  default     = ["35.235.240.0/20"]
}

variable "web_source_ranges" {
  description = "Plage source autorisée pour le trafic HTTP entrant"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_count" {
  description = "Nombre de machines web à créer"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "Gabarit des machines web"
  type        = string
  default     = "e2-small"
}

variable "environment" {
  description = "Environnement cible : dev, test ou prod uniquement"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "La variable environment n'accepte que dev, test ou prod."
  }
}

variable "common_labels" {
  description = "Étiquettes communes appliquées à toutes les ressources"
  type        = map(string)
  default = {
    projet = "nordis"
  }
}
