resource "aws_iam_role" "apprunner_ecr_access" {
  name = "${var.service_name}-apprunner-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "build.apprunner.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "ecr_access" {
  role       = aws_iam_role.apprunner_ecr_access.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}

resource "aws_apprunner_service" "apprunner" {
  service_name = var.service_name

  source_configuration {
    auto_deployments_enabled = true

    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_ecr_access.arn
    }

    image_repository {
      image_repository_type = "ECR"

      image_identifier = "${var.image_repository_url}:${var.image_tag}"

      image_configuration {
        port = var.container_port

        runtime_environment_variables = var.environment_variables
      }
    }
  }

  instance_configuration {
    cpu    = var.cpu
    memory = var.memory
  }

  tags = var.tags
}