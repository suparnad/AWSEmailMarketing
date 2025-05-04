resource "aws_s3_bucket" "this" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "csv" {
  bucket       = aws_s3_bucket.this.id
  key          = "contacts/contact.csv"
  source       = "${path.module}/files/contact.csv"
  etag         = filemd5("${path.module}/files/contact.csv")
  content_type = "text/csv"
}

resource "aws_s3_object" "html_template" {
  bucket       = aws_s3_bucket.this.id
  key          = "templates/email_template.html"
  source       = "${path.module}/files/email_template.html"
  etag         = filemd5("${path.module}/files/email_template.html")
  content_type = "text/html"
}
