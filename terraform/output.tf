output "bucket_name" {
  value = aws_s3_bucket.poc-sftp-s3-bucket.bucket
}

output "sftp_id" {
  value = aws_transfer_server.sftp-poc.id
}

output "sftp_endpoint" {
  value = aws_transfer_server.sftp-poc.endpoint
}
