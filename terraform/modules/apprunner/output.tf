output "repository_arn" {
  value = aws_ecr_repository.apprunner.arn
}

output "repository_name" {
  value = aws_ecr_repository.apprunner.name
}