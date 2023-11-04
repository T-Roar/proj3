# Create a GKE cluster
resource "google_container_cluster" "my_cluster" {
  name     = "my-cluster"
  location = "us-central1"

  network    = google_compute_network.my_network.self_link
  subnetwork = google_compute_subnetwork.my_subnet[0].self_link  # Use the first subnet for the nodes
}