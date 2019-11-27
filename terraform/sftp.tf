resource "aws_iam_role" "sftp-poc-role" {
  name = "sftp-poc-iam-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "transfer.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "sftp-poc-cloudwatch-role-policy" {
  name = "sftp-poc-cloudwatch-iam-policy"
  role = aws_iam_role.sftp-poc-role.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Action": [
            "logs:*"
        ],
        "Resource": "arn:aws:logs:*:*:*"
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy" "sftp-poc-s3-role-policy" {
  name = "sftp-poc-s3-iam-policy"
  role = aws_iam_role.sftp-poc-role.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
          "Sid": "AllowListingFiles",
          "Effect": "Allow",
          "Action": [
            "s3:ListBucket",
            "s3:GetBucketLocation"
          ],
          "Resource": "arn:aws:s3:::${var.s3_poc_sftp_bucket_name}"
        },
        {
          "Sid": "AllowObjectsAccess",
          "Effect": "Allow",
          "Action": [
            "s3:GetObject",
            "s3:GetObjectVersion"
          ],
          "Resource": "arn:aws:s3:::${var.s3_poc_sftp_bucket_name}/*"
        }
    ]
}
POLICY
}

resource "aws_transfer_server" "sftp-poc" {
  identity_provider_type = "SERVICE_MANAGED"
  logging_role           = aws_iam_role.sftp-poc-role.arn
}

resource "aws_transfer_user" "sftp-poc-user" {
  server_id = aws_transfer_server.sftp-poc.id
  user_name = var.poc_sftp_user_name
  role      = aws_iam_role.sftp-poc-role.arn
}

resource "aws_transfer_ssh_key" "sftp-poc-ssh" {
  server_id = aws_transfer_server.sftp-poc.id
  user_name = aws_transfer_user.sftp-poc-user.user_name
  body      = var.poc_sftp_user_ssh_key
}
