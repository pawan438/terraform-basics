# outputs.tf
# Displays useful info after "terraform apply" finishes

output "container_name" {
  description = "Name of the created container"
  value       = docker_container.app_container.name
}

output "container_id" {
  description = "ID of the created container"
  value       = docker_container.app_container.id
}

output "access_url" {
  description = "URL to access the running app"
  value       = "http://localhost:${var.external_port}"
}
