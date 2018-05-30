provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "optimtizely-terraform-remote-state-storage-s3-alarmist"
    dynamodb_table = "optimtizely-terraform-state-lock-dynamo-alarmist"
    region         = "us-west-2"
    key            = "terraform.tfstate"
  }
}

# terraform state file setup
# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "alarmist-terraform-state-storage-s3" {
  bucket = "optimtizely-terraform-remote-state-storage-s3-alarmist"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    enabled                                = true
    abort_incomplete_multipart_upload_days = 1

    noncurrent_version_expiration {
      days = 30
    }
  }

  # This flag provides extra protection against the destruction of a given
  # resource. When this is set to true, any plan that includes a destroy of
  # this resource will return an error message.
  lifecycle {
    prevent_destroy = true
  }
}

# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "optimtizely-terraform-state-lock-dynamo-alarmist"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
