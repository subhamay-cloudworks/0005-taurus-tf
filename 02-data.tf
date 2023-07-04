## ---------------------------------------------------------------------------------------------------------------------
## Provider Definition                  - Project Taurus
## Project Description                  - Creating a Lambda Layer and adding the same to a Lambda function.
## Modification History:
##   - 1.0.0    Jul 04,2023 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------


# AWS Region and Caller Identity
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

# Lambda IAM Policy Document
data "aws_iam_policy_document" "lambda-iam-policy-document" {
  statement {
    sid = "AllowCloudWatchLogStream"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${local.lambda_function_name}:*",
    ]
  }
}

# Lambda code zip file
data "archive_file" "package_zip" {
  type        = "zip"
  source_file = "code/taurus_code.py"
  output_path = "code/taurus_code.zip"
}