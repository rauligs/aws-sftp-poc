require "awspec"

s3_poc_sftp_bucket_name = attribute("input_s3_poc_sftp_bucket_name", {})
sftp_iam_role_name = "sftp-poc-iam-role"

describe "The S3 bucket #{s3_poc_sftp_bucket_name}" do
  subject { s3_bucket(s3_poc_sftp_bucket_name) }

  it { should exist }
end

describe "The IAM role #{sftp_iam_role_name}" do
  subject { iam_role(sftp_iam_role_name) }
  it { should exist }
  it do
    should have_inline_policy().policy_document(<<-'EOF')
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
  end
  it { should be_allowed_action('s3:GetObject').resource_arn("arn:aws:s3:::#{s3_poc_sftp_bucket_name}/*") }
  it { should be_allowed_action('s3:GetObjectVersion').resource_arn("arn:aws:s3:::#{s3_poc_sftp_bucket_name}/*") }
  it { should be_allowed_action('s3:ListBucket').resource_arn("arn:aws:s3:::#{s3_poc_sftp_bucket_name}") }
  it { should be_allowed_action('s3:GetBucketLocation').resource_arn("arn:aws:s3:::#{s3_poc_sftp_bucket_name}") }
  it { should be_allowed_action('logs:*').resource_arn("arn:aws:logs:*:*:*") }
end
