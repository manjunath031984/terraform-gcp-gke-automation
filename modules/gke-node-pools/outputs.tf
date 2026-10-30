output "app_node_pool_name" {
  description = "Application node pool name"
  value       = google_container_node_pool.app.name
}

output "postgres_node_pool_name" {
  description = "PostgreSQL node pool name"
  value       = google_container_node_pool.postgres.name
}

output "app_node_pool_id" {
  description = "Application node pool ID"
  value       = google_container_node_pool.app.id
}

output "postgres_node_pool_id" {
  description = "PostgreSQL node pool ID"
  value       = google_container_node_pool.postgres.id
}

output "node_service_account" {
  description = "Existing service account attached to worker nodes"
  value       = var.node_service_account
}