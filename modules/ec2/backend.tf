terraform {
  required_version = "~> 1.2.4"

  backend "s3" {
bucket = "jumia-cbaptista-bucket-state"
key = "terraform-services-dev"
region = "eu-central-1"
encrypt = "true"
dynamodb_table = "terraform-state-lock-dev"
acl = "private"
  }
}
