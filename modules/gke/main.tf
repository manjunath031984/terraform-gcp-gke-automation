
resource "google_container_cluster" "gke" {
  project  = var.project_id
  name     = var.cluster_name
  location = var.zone

  network    = var.network_name
  subnetwork = var.subnetwork_name

  networking_mode = "VPC_NATIVE"

  # Create node pools separately in Phase 8.
  remove_default_node_pool = true
  initial_node_count       = 1

  deletion_protection = false

  # Kubernetes Pod and Service IP ranges.
  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.services_range_name
  }

  # Private worker nodes, public control-plane endpoint.
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  # Restrict public Kubernetes API access.
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.authorized_network_cidr
      display_name = "Learning workstation"
    }
  }

  # Enable Workload Identity.
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  # GKE Regular release channel.
  release_channel {
    channel = "REGULAR"
  }

  # --------------------------------------------------
  # GKE ADDONS CONFIGURATION
  # --------------------------------------------------

  addons_config {

    # Horizontal Pod Autoscaling.
    horizontal_pod_autoscaling {
      disabled = false
    }

    # Enable GKE Ingress.
    # NGINX Ingress Controller will be deployed separately.
    http_load_balancing {
      disabled = false
    }

    # Google Compute Engine Persistent Disk CSI driver.
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }
  }

  # --------------------------------------------------
  # GKE LOGGING CONFIGURATION
  # --------------------------------------------------

  logging_config {
    enable_components = [
      "SYSTEM_COMPONENTS",
      "WORKLOADS"
    ]
  }

  # --------------------------------------------------
  # GKE MONITORING CONFIGURATION
  # --------------------------------------------------

  monitoring_config {
    enable_components = [
      "SYSTEM_COMPONENTS",
      "APISERVER",
      "SCHEDULER",
      "CONTROLLER_MANAGER",
      "STORAGE",
      "HPA",
      "POD",
      "DAEMONSET",
      "DEPLOYMENT",
      "STATEFULSET",
      "KUBELET",
      "CADVISOR"
    ]

    # Google Cloud Managed Service for Prometheus.
    managed_prometheus {
      enabled = true
    }
  }
}
