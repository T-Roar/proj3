# Define a variable for the number of subnets
variable "subnet_count" {
  description = "Number of subnets"
  type        = number
  default     = 3
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}