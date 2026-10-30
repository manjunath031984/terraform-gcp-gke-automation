variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "cluster_name" {
  description = "Existing GKE cluster name"
  type        = string
}

variable "location" {
  description = "GKE cluster location"
  type        = string
}

variable "node_service_account" {
  description = "Existing service account used by GKE worker nodes"
  type        = string
}

variable "app_machine_type" {
  description = "Machine type for application worker nodes"
  type        = string
  default     = "e2-small"
}
variable "postgres_machine_type" {
  description = "Machine type for PostgreSQL worker nodes"
  type        = string
  default     = "e2-medium"
}

variable "boot_disk_size_gb" {
  description = "Worker node boot disk size"
  type        = number
  default     = 30
}

variable "node_count" {
  description = "Number of nodes in each pool"
  type        = number
  default     = 1
}