# main.tf
# This file defines the provider and the resources Terraform will manage

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Configure the Docker provider (talks to your local Docker daemon)
provider "docker" {}

# Pull the image specified by the variable "image_name"
resource "docker_image" "app_image" {
  name = var.image_name
}

# Run a container using that image
resource "docker_container" "app_container" {
  name  = var.container_name
  image = docker_image.app_image.image_id

  ports {
    internal = var.internal_port
    external = var.external_port
  }
}
