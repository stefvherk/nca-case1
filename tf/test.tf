resource "aws_s3_bucket" "test_bucket" {
  bucket = "github-actions-terraform-test-${random_id.bucket_id.hex}"
  acl    = "private"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}