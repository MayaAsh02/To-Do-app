terraform {
  backend "s3" {
    bucket         = "test-terraform-state-todo"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
