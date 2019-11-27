resource "aws_s3_bucket" "poc-sftp-s3-bucket" {
  bucket  = var.s3_poc_sftp_bucket_name
  acl     = "private"

  tags = {
    Name = "Bucket POC to store direct and retrieve through sftp"
  }
}
