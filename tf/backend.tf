terraform {
  backend "s3" {
    bucket         = "tfstatebucket-stef"    # your S3 bucket
    key            = "project/terraform.tfstate"  # path inside bucket
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}