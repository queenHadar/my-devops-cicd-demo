module "ecr" {
  source = "./modules/ecr"
  repository_name = "${var.repository_name}-${var.environment}"
  tags = var.tags
}

module "ecr" {
  source = "./modules/ecr"
  repository_name = "${var.repository_name}-${var.environment}"
  tags            = var.tags
}

module "apprunner" {
  source = "./modules/apprunner"

  service_name         = "${var.repository_name}-${var.environment}"
  image_repository_url = module.ecr.repository_url
  image_tag            = "latest"
  region               = var.region

  container_port = 8000

  cpu    = var.cpu
  memory = var.memory

  environment_variables = {
    ENV = var.environment
  }

  tags = var.tags
}