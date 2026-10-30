resource "google_compute_router" "router" {
  project = var.project_id
  name    = var.router_name
  region  = var.region
  network = var.network_id

  description = "Cloud Router for private GKE infrastructure"

  bgp {
    asn = 64514
  }
}