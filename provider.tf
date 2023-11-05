provider "google" {
  credentials = jsondecode(var.google_credentials)
  project     = var.project_id
  region      = var.region
}
