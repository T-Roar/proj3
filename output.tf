# Output cluster information
output "cluster_endpoint" {
  value = google_container_cluster.roar_cluster.endpoint
}

output "cluster_master_version" {
  value = google_container_cluster.roar_cluster.master_version
}