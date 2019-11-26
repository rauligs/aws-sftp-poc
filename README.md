# aws-sftp-poc

## Installation
* Pre-req. Install bundler:
```shell script
brew update
```

```shell script
brew install ruby
gem install bundler
```

* Install ruby dependencies:
```shell script
bundle install
```

* Pre-req. Install terraform:
```shell script
brew install terraform
```

* Check [terraform fmt](https://www.terraform.io/docs/commands/fmt.html):
```shell script
terraform fmt -check
```
## Generate SSH Key for SFTP
```shell script
ssh-keygen -f poc_sftp_ssh -t rsa
ssh-add -K poc_sftp_ssh
export POC_SFTP_SSH=$(cat poc_sftp_ssh.pub)
```

* the public key will be already in the clipboard, paste in in kitchen.yml poc_sftp_user_ssh_key 

## Environment variables
```shell script
export AWS_PROFILE=your_aws_profile_here
export AWS_REGION=eu-west-1
```

## Terraform Remote State
* [Create S3 remote state bucket](remote-state/README.md) (only once per remote state)

## Kitchen Terraform
* Run kitchen terraform (converge + verify + destroy):
```shell script
bundle exec kitchen test -d always
```

* Kitchen. Deploy only:
```shell script
bundle exec kitchen converge
```

* Kitchen. Test only:
```shell script
bundle exec kitchen verify
```

* Kitchen. Destroy only:
```shell script
bundle exec kitchen destroy
```
