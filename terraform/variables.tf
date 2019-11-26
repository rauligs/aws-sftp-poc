variable "s3_remote_state_bucket_name" {
  type        = string
  description = "The name for the S3 remote state bucket"
}

variable "s3_poc_sftp_bucket_name" {
  type        = string
  description = "The name for the S3 bucket for poc sftp"
}

variable "poc_sftp_user_ssh_key" {
  type        = string
  description = "The public ssh key for user access to sftp"
}

variable "poc_sftp_user_name" {
  type        = string
  description = "The user name of user accessing the sftp"
}
