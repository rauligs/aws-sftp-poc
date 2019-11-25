# aws-sftp-poc
* Pre-req. Install bundler:

```shell script
brew install ruby
gem install bundler
```

* Pre-req. Install terraform:
```shell script
brew update
brew install terraform
```

* Pre-req. [Create S3 remote state bucket](infra/remote-state/README.md) (only once per remote state)

* Pre-req. environment vars
```shell script
export AWS_PROFILE=your_aws_profile_here
export AWS_REGION=eu-west-1
```

* Check [terraform fmt](https://www.terraform.io/docs/commands/fmt.html):
```shell script
terraform fmt -check
```

* Install dependencies:
```shell script
bundle install
```

* Run tests (converge + verify + destroy):
```shell script
bundle exec kitchen test -d always
```

* Manual test deployed infra:
```shell script
bundle exec kitchen converge
```

* Manual destroy deployed infra:
```shell script
bundle exec kitchen destroy
```
