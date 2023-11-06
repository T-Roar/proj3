# Define a variable for the number of subnets
variable "subnet_count" {
  description = "Number of subnets"
  type        = number
  default     = 3
}

variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "zone" {
  type = string
}

variable "google_credentials" {
  type = list(string)
}