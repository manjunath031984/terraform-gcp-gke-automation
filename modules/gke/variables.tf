variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "zone" {
  description = "GKE cluster zone"
  type        = string
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
}

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork_name" {
  description = "Private subnet name"
  type        = string
}

variable "pods_range_name" {
  description = "Secondary IP range for Kubernetes Pods"
  type        = string
}

variable "services_range_name" {
  description = "Secondary IP range for Kubernetes Services"
  type        = string
}

variable "authorized_network_cidr" {
  description = "Public IPv4 CIDR authorized to access the Kubernetes API"
  type        = string
  default     = "103.203.38.57/32"
}

variable "master_ipv4_cidr_block" {
  description = "Private IP range for the GKE control plane"
  type        = string
  default     = "172.16.0.0/28"
}