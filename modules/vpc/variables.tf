variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
}

variable "network_name" {
  description = "Custom VPC name"
  type        = string
}

variable "public_subnet_name" {
  description = "Public subnet name"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
}

variable "private_subnet_name" {
  description = "Private subnet name"
  type        = string
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
}

variable "pods_range_name" {
  description = "GKE Pods secondary range name"
  type        = string
}

variable "pods_cidr" {
  description = "GKE Pods secondary range CIDR"
  type        = string
}

variable "services_range_name" {
  description = "GKE Services secondary range name"
  type        = string
}

variable "services_cidr" {
  description = "GKE Services secondary range CIDR"
  type        = string
}