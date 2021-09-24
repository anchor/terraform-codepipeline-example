# Terraform CodePipeline Sample

## Workflow

This project is geared towards deploying a sample static website to an S3 Bucket using an AWS CodePipeline

Source   : CodeCommit
Approval : Manual
Deploy   : S3 Bucket

Everything used within this environment should be covered under the AWS Free Tier.

## Getting Started

### AWS Environment Setup
This example assumes that you have installed the AWS CLI Locally https://aws.amazon.com/cli/

To Run terraform, you will need to generate an AWS Access Key, and Secret Access Key, and run `aws configure` on your local terminal.

### CodeCommit Setup
You will need to install CodeCommit HTTPS GRC for your local machine to be able to checkout your created CodeCommit Repo

https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-git-remote-codecommit.html

### Install Terraform
You can download the terraform CLI tool from https://www.terraform.io/downloads.html

### Initialise the project
Change directories into the `account-1` directory and run `terraform init`. This will download any required modules or tools to initialise your code.

### Plan & Apply your Changes
Update the "default" values within the `variables.tf` file to those which match your use case.

Run `terraform plan` in order to plan your changes. Provided nothing conflicts, you should be fine to go ahead and apply your changes

### Apply your Changes
Run `terraform apply` to deploy the environment. You will have to answer 'yes' once the plan has been done in order to deploy changes

### Post-Deployment
Once you have deployed the environment, it should give you a command to `git clone` in the "outputs" section - as well as the link to your website. 

To see this again this just run `terraform output`.
