variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region for the static public IP"
  type        = string
}

variable "address_name" {
  description = "Name of the regional static external IP address"
  type        = string
}

variable "network_tier" {
  description = "Google Cloud network service tier"
  type        = string
  default     = "PREMIUM"

  validation {
    condition = contains(
      ["PREMIUM", "STANDARD"],
      var.network_tier
    )
    error_message = "Network tier must be PREMIUM or STANDARD."
  }
}