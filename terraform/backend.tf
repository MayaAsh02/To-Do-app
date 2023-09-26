terraform {
  backend "s3" {
    bucket         = "terraform-state-todo"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_locks2"
  }
}
