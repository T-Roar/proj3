# Create a GKE cluster
resource "google_container_cluster" "roar_cluster" {
  name     = "my-cluster"
  location = "us-central1"

  network    = google_compute_network.roar_network.self_link
  subnetwork = google_compute_subnetwork.roar_subnet[0].self_link # Use the first subnet for the nodes

  # Cluster Configuration
  initial_node_count = 1
  node_locations    = ["us-central1-a", "us-central1-b", "us-central1-c"]

  # Cluster Addons
  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
    http_load_balancing {
      disabled = false
    }

    network_policy_config {
      disabled = false
    }
  }

  # Node Pool Autoscaling
  node_pool {
    name             = "autoscaling-pool"
    initial_node_count = 2
    autoscaling {
      min_node_count = 1
      max_node_count = 3
    }
  }
  
}
