
# --------------------------------------------------
# VPC MODULE
# --------------------------------------------------

module "vpc" {
  source = "../../modules/vpc"

  project_id = var.project_id
  region     = var.region

  network_name = "gke-dev-vpc"

  # Public subnet
  public_subnet_name = "gke-public-subnet"
  public_subnet_cidr = "10.10.1.0/24"

  # Private subnet
  private_subnet_name = "gke-private-subnet"
  private_subnet_cidr = "10.10.2.0/24"

  # GKE secondary IP ranges on private subnet
  pods_range_name = "gke-dev-pods"
  pods_cidr       = "10.20.0.0/16"

  services_range_name = "gke-dev-services"
  services_cidr       = "10.30.0.0/20"
}

# --------------------------------------------------
# FIREWALL MODULE
# --------------------------------------------------

module "firewall" {
  source = "../../modules/firewall"

  project_id   = var.project_id
  network_name = module.vpc.network_name

  firewall_name = "gke-allow-internal"

  source_ranges = [
    "10.10.1.0/24",
    "10.10.2.0/24",
    "10.20.0.0/16",
    "10.30.0.0/20"
  ]

  target_tags = ["gke-node"]
}

# --------------------------------------------------
# CLOUD ROUTER MODULE
# --------------------------------------------------

module "cloud_router" {
  source = "../../modules/cloud-router"

  project_id = var.project_id
  region     = var.region

  network_id  = module.vpc.network_id
  router_name = "gke-dev-router"
}

# --------------------------------------------------
# CLOUD NAT MODULE
# --------------------------------------------------

module "cloud_nat" {
  source = "../../modules/cloud-nat"

  project_id = var.project_id
  region     = var.region

  router_name              = module.cloud_router.router_name
  nat_name                 = "gke-dev-nat"
  private_subnet_self_link = module.vpc.private_subnet_self_link
}

# --------------------------------------------------
# GKE CLUSTER MODULE
# --------------------------------------------------

module "gke" {
  source = "../../modules/gke"

  project_id   = var.project_id
  zone         = var.zone
  cluster_name = "gke-dev-cluster"

  network_name    = module.vpc.network_name
  subnetwork_name = module.vpc.private_subnet_name

  pods_range_name     = module.vpc.pods_range_name
  services_range_name = module.vpc.services_range_name

  authorized_network_cidr = "103.203.38.57/32"

  master_ipv4_cidr_block = "172.16.0.0/28"

  depends_on = [
    module.cloud_nat
  ]
}

# --------------------------------------------------
# GKE NODE POOLS MODULE
# --------------------------------------------------

module "gke_node_pools" {
  source = "../../modules/gke-node-pools"

  project_id   = var.project_id
  cluster_name = module.gke.cluster_name
  location     = module.gke.cluster_location

  # Existing service account - no new service account
  node_service_account = "985659911807-compute@developer.gserviceaccount.com"

  # Application and PostgreSQL node sizes
  app_machine_type      = "e2-small"
  postgres_machine_type = "e2-medium"

  boot_disk_size_gb = 30
  node_count        = 1
}

# --------------------------------------------------
# ARTIFACT REGISTRY MODULE
# --------------------------------------------------

module "artifact_registry" {
  source = "../../modules/artifact-registry"

  project_id      = var.project_id
  region          = var.region
  repository_name = "gke-dev-repo"

  description = "Private Docker repository for GKE dev workloads"

  labels = {
    environment = "dev"
    managed_by  = "terraform"
    platform    = "gke"
  }
}
# --------------------------------------------------
# STATIC PUBLIC IP - NGINX INGRESS
# --------------------------------------------------

module "static_ip" {
  source = "../../modules/static-ip"

  project_id   = var.project_id
  region       = var.region
  address_name = "gke-dev-nginx-public-ip"
  network_tier = "PREMIUM"
}