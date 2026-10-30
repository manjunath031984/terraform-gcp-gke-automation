resource "google_compute_network" "vpc" {
  project                 = var.project_id
  name                    = var.network_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"

  description = "Custom VPC for GKE infrastructure"
}

# Public subnet
resource "google_compute_subnetwork" "public" {
  project       = var.project_id
  name          = var.public_subnet_name
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.public_subnet_cidr

  private_ip_google_access = true

  description = "Public subnet for public-facing infrastructure"
}

# Private subnet
resource "google_compute_subnetwork" "private" {
  project       = var.project_id
  name          = var.private_subnet_name
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.private_subnet_cidr

  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pods_range_name
    ip_cidr_range = var.pods_cidr
  }

  secondary_ip_range {
    range_name    = var.services_range_name
    ip_cidr_range = var.services_cidr
  }

  description = "Private subnet for GKE worker nodes and workloads"
}
