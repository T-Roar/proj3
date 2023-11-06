resource "google_container_cluster" "roar_cluster" {
  name     = "roar-cluster"
  location = var.gcp_region
  initial_node_count       = var.initial_node_count
  remove_default_node_pool = true
  network                  = "default"
}

resource "google_container_node_pool" "roar_nodes" {
  name       = "my-node-pool"
  location   = var.gcp_region
  cluster    = google_container_cluster.roar_cluster.name
  node_count = var.initial_node_count

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}