# Create a GKE cluster
resource "google_container_cluster" "roar_cluster" {
  name     = "my-cluster"
  location = "us-central1"

  network    = google_compute_network.roar_network.self_link
  subnetwork = google_compute_subnetwork.roar_subnet[0].self_link # Use the first subnet for the nodes

  # Cluster Configuration
  initial_node_count = 1
  node_locations    = ["us-east1-a", "us-east1-b", "us-east1-c"]

  # Node Pool Configuration
  node_pool {
    name             = "default-pool"
    initial_node_count = 1
    
    node_config {
      machine_type     = "n1-standard-1"  # Set your preferred machine type
    }
  }

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

    node_config {
      machine_type     = "n1-standard-2"
    }

    autoscaling {
      min_node_count = 1
      max_node_count = 3
    }
  }

  # Master Authentication
#   master_auth {
#     username = "admin"  # Set your desired username or leave it as "admin"
#     password = "Password"  # Set your desired password or leave it empty for auto-generated
#     client_certificate_config {
#       issue_client_certificate = false
#     }
#   }

  # Node Pool Management
  node_pool {
    name             = "management-pool"
    initial_node_count = 1

    node_config {
      machine_type     = "n1-standard-1"  # Set your preferred machine type
    }

    management {
      auto_repair  = true
      auto_upgrade = true
    }
  }
}
