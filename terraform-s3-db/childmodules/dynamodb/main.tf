# Create dynamodb table to lock terraform state files
resource "aws_dynamodb_table" "dynamodb-table" {
  name           = var.db-name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key

  attribute {
    name        = var.hash_key
    type        = var.type 
    
  }
}