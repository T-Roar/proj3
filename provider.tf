provider "google" {
  credentials = jsondecode({"access_token": "${var.google_access_token}"})
  project     = var.project_id
  region      = var.region
}
