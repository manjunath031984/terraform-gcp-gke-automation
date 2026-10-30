resource "google_compute_router_nat" "nat" {
  project = var.project_id
  name    = var.nat_name
  router  = var.router_name
  region  = var.region

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = var.private_subnet_self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }

  # Google-managed dynamic port allocation is enabled.
  enable_dynamic_port_allocation = true

  # Reserve a minimum number of ports per VM.
  min_ports_per_vm = 64
}