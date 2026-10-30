resource "google_compute_address" "nginx_public_ip" {
  project      = var.project_id
  name         = var.address_name
  region       = var.region
  address_type = "EXTERNAL"
  network_tier = var.network_tier

  description = "Static public IP for GKE NGINX Ingress Network Load Balancer"
}