
resource "google_artifact_registry_repository" "docker" {
  project       = var.project_id
  location      = var.region
  repository_id = var.repository_name
  description   = var.description
  format        = "DOCKER"

  labels = var.labels

  docker_config {
    immutable_tags = false
  }
}
