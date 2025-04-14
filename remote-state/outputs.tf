output "backend_aws_region" {
  value = aws_s3_bucket.terraform_back_end_state.region
}

output "backend_s3_bucket_name" {
  value = aws_s3_bucket.terraform_back_end_state.id
}

output "backend_dynamodb_table" {
  value = aws_dynamodb_table.terraform_locks.id
}