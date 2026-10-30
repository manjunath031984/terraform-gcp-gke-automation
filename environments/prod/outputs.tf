output "vpc_network_name" {
  description = "VPC network name"
  value       = module.vpc.network_name
}

output "vpc_network_id" {
  description = "VPC network ID"
  value       = module.vpc.network_id
}

output "public_subnet_name" {
  description = "Public subnet name"
  value       = module.vpc.public_subnet_name
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_name" {
  description = "Private subnet name"
  value       = module.vpc.private_subnet_name
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = module.vpc.private_subnet_id
}

output "pods_range_name" {
  description = "GKE Pods secondary range"
  value       = module.vpc.pods_range_name
}

output "services_range_name" {
  description = "GKE Services secondary range"
  value       = module.vpc.services_range_name
}
output "firewall_rule_name" {
  description = "Internal firewall rule name"
  value       = module.firewall.firewall_rule_name
}

output "firewall_rule_id" {
  description = "Internal firewall rule ID"
  value       = module.firewall.firewall_rule_id
}
output "cloud_router_name" {
  description = "Cloud Router name"
  value       = module.cloud_router.router_name
}

output "cloud_router_id" {
  description = "Cloud Router ID"
  value       = module.cloud_router.router_id
}

output "cloud_nat_name" {
  description = "Cloud NAT name"
  value       = module.cloud_nat.nat_name
}

output "cloud_nat_region" {
  description = "Cloud NAT region"
  value       = module.cloud_nat.nat_region
}
output "gke_cluster_name" {
  description = "GKE cluster name"
  value       = module.gke.cluster_name
}

output "gke_cluster_location" {
  description = "GKE cluster location"
  value       = module.gke.cluster_location
}

output "gke_cluster_endpoint" {
  description = "GKE Kubernetes API endpoint"
  value       = module.gke.cluster_endpoint
}

output "gke_workload_identity_pool" {
  description = "GKE Workload Identity pool"
  value       = module.gke.workload_identity_pool
}
