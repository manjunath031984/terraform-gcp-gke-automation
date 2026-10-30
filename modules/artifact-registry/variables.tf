
variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Artifact Registry location"
  type        = string
}

variable "repository_name" {
  description = "Artifact Registry Docker repository name"
  type        = string
}

variable "description" {
  description = "Artifact Registry repository description"
  type        = string
  default     = "Private Docker repository for GKE dev workloads"
}

variable "labels" {
  description = "Labels assigned to the repository"
  type        = map(string)
  default = {
    environment = "dev"
    managed_by  = "terraform"
    platform    = "gke"
  }
}
