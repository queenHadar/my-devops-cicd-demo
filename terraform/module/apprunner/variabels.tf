variable "service_name" {
  type        = string
  description = "App Runner service name"
}

variable "image_repository_url" {
  type        = string
  description = "ECR repository URL"
}

variable "image_tag" {
  type        = string
  default     = "latest"
}

variable "container_port" {
  type        = number
  default     = 8000
}

variable "cpu" {
  type    = string
  default = "1024"
}

variable "memory" {
  type    = string
  default = "2048"
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "region" {
  type = string
}