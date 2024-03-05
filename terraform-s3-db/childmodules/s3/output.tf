# Output the bucket id
output "bucket" {
  value = aws_s3_bucket.bucket.id
}