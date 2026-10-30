
output "repository_id" {
  description = "Artifact Registry repository ID"
  value       = google_artifact_registry_repository.docker.repository_id
}

output "repository_name" {
  description = "Artifact Registry repository resource name"
  value       = google_artifact_registry_repository.docker.name
}

output "repository_location" {
  description = "Artifact Registry repository location"
  value       = google_artifact_registry_repository.docker.location
}

output "docker_repository_url" {
  description = "Docker image registry URL"
  value       = "${google_artifact_registry_repository.docker.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.docker.repository_id}"
}
