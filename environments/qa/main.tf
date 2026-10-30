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
module "cloud_router" {
  source = "../../modules/cloud-router"

  project_id = var.project_id
  region     = var.region

  network_id  = module.vpc.network_id
  router_name = "gke-dev-router"
}
module "cloud_nat" {
  source = "../../modules/cloud-nat"

  project_id = var.project_id
  region     = var.region

  router_name              = module.cloud_router.router_name
  nat_name                 = "gke-dev-nat"
  private_subnet_self_link = module.vpc.private_subnet_self_link
}
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