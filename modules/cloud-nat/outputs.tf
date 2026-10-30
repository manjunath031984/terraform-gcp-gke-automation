output "nat_name" {
  description = "Cloud NAT name"
  value       = google_compute_router_nat.nat.name
}

output "nat_router" {
  description = "Cloud Router associated with NAT"
  value       = google_compute_router_nat.nat.router
}

output "nat_region" {
  description = "Cloud NAT region"
  value       = google_compute_router_nat.nat.region
}
