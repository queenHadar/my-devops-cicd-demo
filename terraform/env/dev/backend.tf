terraform {
  backend "s3" {
    bucket         = "mentte-backet-128353492351-eu-north-1-an" 
    key            = "dev/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}