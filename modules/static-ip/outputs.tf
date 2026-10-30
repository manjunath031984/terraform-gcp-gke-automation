output "static_ip_address" {
  description = "Reserved external static IPv4 address"
  value       = google_compute_address.nginx_public_ip.address
}

output "static_ip_name" {
  description = "Name of the reserved static IP resource"
  value       = google_compute_address.nginx_public_ip.name
}

output "static_ip_self_link" {
  description = "Self link of the reserved static IP"
  value       = google_compute_address.nginx_public_ip.self_link
}

output "static_ip_region" {
  description = "Region of the reserved static IP"
  value       = google_compute_address.nginx_public_ip.region
}
