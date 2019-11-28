terraform {
  backend "s3" {
    bucket = var.s3_remote_state_bucket_name
    key    = "poc-sftp/terraform.tfstate"
    region = "us-west-1"
    # Uncomment for deployments from local your machine
    # shared_credentials_file = "~/.aws/credentials"
    # profile                 = "your_aws_profile_here"
  }
}
