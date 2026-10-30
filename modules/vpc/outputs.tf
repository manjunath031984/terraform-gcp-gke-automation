output "network_id" {
  description = "VPC network ID"
  value       = google_compute_network.vpc.id
}

output "network_name" {
  description = "VPC network name"
  value       = google_compute_network.vpc.name
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = google_compute_subnetwork.public.id
}

output "public_subnet_name" {
  description = "Public subnet name"
  value       = google_compute_subnetwork.public.name
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = google_compute_subnetwork.private.id
}

output "private_subnet_name" {
  description = "Private subnet name"
  value       = google_compute_subnetwork.private.name
}

output "pods_range_name" {
  description = "GKE Pods secondary range"
  value       = var.pods_range_name
}

output "services_range_name" {
  description = "GKE Services secondary range"
  value       = var.services_range_name
}
output "private_subnet_self_link" {
  description = "Private subnet self link for Cloud NAT"
  value       = google_compute_subnetwork.private.self_link
}