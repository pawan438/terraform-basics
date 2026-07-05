# variables.tf
# Defines input variables so main.tf isn't hardcoded

variable "image_name" {
  description = "Docker image to pull and run"
  type        = string
  default     = "nginx:latest"
}

variable "container_name" {
  description = "Name to give the running container"
  type        = string
  default     = "terraform-nginx"
}

variable "internal_port" {
  description = "Port the container listens on internally"
  type        = number
  default     = 80
}

variable "external_port" {
  description = "Port exposed on your local machine"
  type        = number
  default     = 8080
}
