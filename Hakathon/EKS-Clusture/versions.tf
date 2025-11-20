terraform {
    required_version = ">= 1.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 5.1"
    }
  }
  backend "s3" {
    bucket         = "my-s3-backend-bucket-1"
    key            = "test/terraform.tfstate"
    region         = "us-west-1"
    encrypt = true
    use_lockfile = true
  }
}