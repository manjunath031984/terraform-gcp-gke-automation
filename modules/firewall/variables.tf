variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "network_name" {
  description = "VPC network where firewall rules will be applied"
  type        = string
}

variable "firewall_name" {
  description = "Firewall rule name"
  type        = string
}

variable "source_ranges" {
  description = "Trusted internal source CIDR ranges"
  type        = list(string)
}

variable "target_tags" {
  description = "Target network tags for firewall rule"
  type        = list(string)
}