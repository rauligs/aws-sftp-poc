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

## Environment variables (dotenv)
copy `.env.example` as `.env` and edit the file populating it with the desired values
```shell script
cp .env.example .env
```

### Generate SSH Key for SFTP
```shell script
ssh-keygen -f poc_sftp_ssh -t rsa
ssh-add -K poc_sftp_ssh
pbcopy < poc_sftp_ssh.pub
```
* Now the public key will be already in the clipboard, paste in as the value for `POC_SFTP_USER_SSH` env var

### Load environment vars
```shell script
source .env
```

## Terraform Remote State
* [How to create a S3 remote state bucket](remote-state/README.md) (once per remote state)

## Kitchen Terraform
* Run kitchen terraform (converge + verify + destroy):
```shell script
bundle exec dotenv kitchen test -d always
```

* Kitchen. Deploy only:
```shell script
bundle exec dotenv kitchen converge
```

* Kitchen. Test only:
```shell script
bundle exec dotenv kitchen verify
```

* Kitchen. Destroy only:
```shell script
bundle exec dotenv kitchen destroy
```
