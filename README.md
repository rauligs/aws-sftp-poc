# aws-sftp-poc
* Pre-req. Install bundler:
```shell script
brew update
```

```shell script
brew install ruby
gem install bundler
```

* Pre-req. Install terraform:
```shell script
brew install terraform
```

* Pre-req. [Create S3 remote state bucket](remote-state/README.md) (only once per remote state)

* Pre-req. environment vars
```shell script
export AWS_PROFILE=your_aws_profile_here
export AWS_REGION=eu-west-1
```

* Check [terraform fmt](https://www.terraform.io/docs/commands/fmt.html):
```shell script
terraform fmt -check
```

* Install ruby dependencies:
```shell script
bundle install
```

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
