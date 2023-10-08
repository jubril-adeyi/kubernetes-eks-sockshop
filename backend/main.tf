provider "aws" {
#  access_key = var.access_key
 # secret_key = var.secret_key
  region     = var.region
}

resource "aws_s3_bucket" "tf_backend_bucket" {
  bucket = var.bucket_name
  acl="private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  lifecycle {
    prevent_destroy = false
  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_bckend_bucket_encrypt" {
  bucket = aws_s3_bucket.tf_backend_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_s3_bucket_versioning" "backend_bucket_versioning" {
  bucket = aws_s3_bucket.tf_backend_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# resource "aws_s3_bucket_acl" "backend_bucket_acl" {
#   bucket = aws_s3_bucket.tf_backend_bucket.id
#   acl = "private"
# }


# DynamoDb for state file locking

resource "aws_dynamodb_table" "terraform-state-lock" {
  name         = var.dynamo-db-name
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}
