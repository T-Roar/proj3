# Create a VPC network
resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

# Create subnets using for_each
resource "google_compute_subnetwork" "my_subnet" {
  for_each          = { for i in range(var.subnet_count) : i => i }
  name              = "subnet-${each.value}"
  network           = google_compute_network.my_network.self_link
  ip_cidr_range     = "10.0.${each.value}.0/24"
  region            = "us-central1"
}

# Create a firewall rule to allow incoming traffic
resource "google_compute_firewall" "allow_ingress" {
  name    = "allow-ingress"
  network = google_compute_network.my_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}