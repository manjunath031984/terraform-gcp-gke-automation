output "cluster_name" {
  description = "GKE cluster name"
  value       = google_container_cluster.gke.name
}

output "cluster_location" {
  description = "GKE cluster location"
  value       = google_container_cluster.gke.location
}

output "cluster_endpoint" {
  description = "GKE Kubernetes API endpoint"
  value       = google_container_cluster.gke.endpoint
}

output "cluster_self_link" {
  description = "GKE cluster self link"
  value       = google_container_cluster.gke.self_link
}

output "workload_identity_pool" {
  description = "GKE Workload Identity pool"
  value       = google_container_cluster.gke.workload_identity_config[0].workload_pool
}
