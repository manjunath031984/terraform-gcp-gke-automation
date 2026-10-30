terraform {
  backend "gcs" {
    bucket                      = "gcp-terraform-state-985659911807"
    prefix                      = "terraform/state/dev"
    impersonate_service_account = "985659911807-compute@developer.gserviceaccount.com"
  }
}
