variable "project_name" {
  default = "ToDo-app"
  type    = string
}

variable "environment" {
  default = "dev"
  type    = string
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
  type    = string
}

variable "aws_access_key" {
  description = "aws access key"
  sensitive = true
}

variable "aws_secret_key" {
  description = "aws secret access key"
  sensitive = true
}

variable "num_of_azs" {
  default = 3
  type    = number
}

variable "mongo_uri" {
  description = "MongoDB URI"
  type        = string
}

variable "tags" {
  default = {
    Terraform = "true"
  }
}
