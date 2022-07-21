

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags = {
    Name        = "S3"
  }

}

  resource "aws_s3_bucket_acl" "s3" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
  }