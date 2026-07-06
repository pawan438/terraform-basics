# outputs.tf
# Pulls outputs up from the module so they show after "terraform apply"
output "container_name" {
  description = "Name of the created container"
  value       = module.app_container.container_name
}

output "container_id" {
  description = "ID of the created container"
  value       = module.app_container.container_id
}

output "access_url" {
  description = "URL to access the running app"
  value       = module.app_container.access_url
}
