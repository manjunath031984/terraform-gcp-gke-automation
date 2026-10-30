resource "google_compute_firewall" "allow_internal" {
  project     = var.project_id
  name        = var.firewall_name
  network     = var.network_name
  description = "Allow required internal communication for GKE workloads"

  direction     = "INGRESS"
  priority      = 1000
  source_ranges = var.source_ranges
  target_tags   = var.target_tags

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }
}
