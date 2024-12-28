terraform {
    backend "s3" {
      bucket = "static-website-backend983"
      key = "nginx/state"
      region = "eu-west-2"
    }
}

#creating dynomodb to enable the state file
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "nginx-state"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}