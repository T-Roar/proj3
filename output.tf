# Output cluster information
output "cluster_endpoint" {
  value = google_container_cluster.my_cluster.endpoint
}

output "cluster_master_version" {
  value = google_container_cluster.my_cluster.master_version
}