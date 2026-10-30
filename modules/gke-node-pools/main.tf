
# Grant the minimum GKE node role to the existing service account.
resource "google_project_iam_member" "node_service_account_role" {
  project = var.project_id
  role    = "roles/container.defaultNodeServiceAccount"
  member  = "serviceAccount:${var.node_service_account}"
}

# Application worker pool.
resource "google_container_node_pool" "app" {
  project  = var.project_id
  name     = "gke-app-pool"
  location = var.location
  cluster  = var.cluster_name

  node_count = var.node_count

  node_config {
    machine_type    = var.app_machine_type
    disk_size_gb    = var.boot_disk_size_gb
    disk_type       = "pd-standard"
    service_account = var.node_service_account

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      workload    = "app"
      environment = "dev"
    }

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  depends_on = [
    google_project_iam_member.node_service_account_role
  ]
}

# Dedicated PostgreSQL worker pool.
resource "google_container_node_pool" "postgres" {
  project  = var.project_id
  name     = "gke-postgres-pool"
  location = var.location
  cluster  = var.cluster_name

  node_count = var.node_count

  node_config {
    machine_type    = var.postgres_machine_type
    disk_size_gb    = var.boot_disk_size_gb
    disk_type       = "pd-standard"
    service_account = var.node_service_account

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      workload    = "postgres"
      environment = "dev"
    }

    taint {
      key    = "dedicated"
      value  = "postgres"
      effect = "NO_SCHEDULE"
    }

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  depends_on = [
    google_project_iam_member.node_service_account_role
  ]
}
