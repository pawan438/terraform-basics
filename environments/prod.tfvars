# environments/prod.tfvars
image_name     = "nginx:stable"
container_name = "terraform-nginx"
internal_port  = 80
external_port  = 8081
