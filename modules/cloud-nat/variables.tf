variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
}

variable "router_name" {
  description = "Cloud Router used by Cloud NAT"
  type        = string
}

variable "nat_name" {
  description = "Cloud NAT name"
  type        = string
}

variable "private_subnet_self_link" {
  description = "Private subnet self link"
  type        = string
}