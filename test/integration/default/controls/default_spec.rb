require "awspec"

s3_poc_sftp_bucket_name = attribute("input_poc_sftp_bucket_name", {})

describe "The S3 bucket #{s3_poc_sftp_bucket_name}" do
  subject { s3_bucket(s3_poc_sftp_bucket_name) }

  it { should exist }
end
