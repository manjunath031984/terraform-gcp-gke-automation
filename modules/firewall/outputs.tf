output "firewall_rule_name" {
  description = "Internal firewall rule name"
  value       = google_compute_firewall.allow_internal.name
}

output "firewall_rule_id" {
  description = "Internal firewall rule ID"
  value       = google_compute_firewall.allow_internal.id
}
