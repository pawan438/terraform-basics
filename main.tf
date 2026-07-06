# main.tf
# Root module — provider config + calls the reusable docker-container module
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

module "app_container" {
  source = "./modules/docker-container"

  image_name     = var.image_name
  container_name = "${var.container_name}-${terraform.workspace}"
  internal_port  = var.internal_port
  external_port  = var.external_port
}
