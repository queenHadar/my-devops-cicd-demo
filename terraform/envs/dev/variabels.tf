variable "Environment" {
  default     = "dev"
}

variable "repository_name" {
  default     = "ecr-mentee"
}

variable "tags" {
  type    = map(string)
  default = {
    env = "dev"
  }
}

variable "cpu" {
  description = "App Runner CPU units"
  type        = string
  default     = "1024"
}

variable "memory" {
  description = "App Runner memory (MB)"
  type        = string
  default     = "2048"
}

variable "region" {
  type    = string
  default = "eu-north-1"
}