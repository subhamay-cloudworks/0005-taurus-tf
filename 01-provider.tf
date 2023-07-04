## ---------------------------------------------------------------------------------------------------------------------
## Provider Definition                  - Project Taurus
## Project Description                  - Creating a Lambda Layer and adding the same to a Lambda function.
## Modification History:
##   - 1.0.0    Jul 04,2023 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------

terraform {
  backend "s3" {
    bucket = "subhamay-tf-remote-state-us-east-1" // Bucket where to SAVE Terraform State
    key    = "0005-taurus/devl/terraform.tfstate" // Object name in the bucket to SAVE Terraform State
    region = "us-east-1"                          // Region where bucket created
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}