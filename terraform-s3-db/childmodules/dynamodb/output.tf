#Output dynamodb name
output "db-name-name" {
    value = aws_dynamodb_table.dynamodb-table.name
}