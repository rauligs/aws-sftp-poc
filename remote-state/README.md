# Bootstrap terraform remote state

In order to create the initial S3 bucket to store terraform remote state has been created this terraform
configuration expected to run only once (per backend state). Kitchen tests won't work otherwise anyway so
needs to be set up prior running Kitchen tests for our lambdas.

## Run
* Make sure `.env` have been already sourced, otherwise create `POC_SFTP_TERRAFORM_STATE` env var

```shell script
terraform init
TF_VAR_s3_remote_state_bucket_name=bucket_name terraform apply
```
