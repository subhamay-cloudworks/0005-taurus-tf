## ---------------------------------------------------------------------------------------------------------------------
## Resources Definition                 - Project Taurus
## Project Description                  - Creating a Lambda Layer and adding the same to a Lambda function.
## Modification History:
##   - 1.0.0    Jul 04,2023 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------


########################################  Local Variables ####################################
locals {
  tags = tomap({
    Environment = var.environment_name
    ProjectName = var.project_name
  })
}

locals {
  lambda_function_name = "${var.project_name}-${var.lambda_function_base_name}-${var.environment_name}-${data.aws_region.current.name}"
}

locals {
  lambda_layer_name = "${var.project_name}-${var.lambda_layer_base_name}-${var.environment_name}-${data.aws_region.current.name}"
}

locals {
  lambda_iam_role_name = "${var.project_name}-${var.lambda_iam_role_name}"
}

locals {
  lambda_iam_policy_name = "${var.project_name}-${var.lambda_iam_policy_name}"
}

######################################## Lambda IAM Role ###########################################
resource "aws_iam_role" "lambda-iam-role" {
  name        = local.lambda_iam_role_name
  description = "Taurus Lambda execution role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "LambdaTrustPolicy"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  tags = local.tags
}
######################################## Lambda IAM Policy #########################################
resource "aws_iam_policy" "lambda-iam-policy" {
  name        = local.lambda_iam_policy_name
  path        = "/"
  description = "Taurus Lambda execution policy"


  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = data.aws_iam_policy_document.lambda-iam-policy-document.json
}
######################################## Lambda IAM Role / Policy attachment #######################
resource "aws_iam_role_policy_attachment" "lambda-iam-role-policy-attachment" {
  depends_on = [aws_iam_role.lambda-iam-role, aws_iam_policy.lambda-iam-policy]

  role       = aws_iam_role.lambda-iam-role.name
  policy_arn = aws_iam_policy.lambda-iam-policy.arn
}

######################################## Lambda Layer ##############################################
resource "aws_lambda_layer_version" "lambda-layer" {
  layer_name               = local.lambda_layer_name
  description              = "Taurus Lambda Layer for Demo"
  license_info             = "Subhamay"
  s3_bucket                = var.lambda_code_repository_s3_bucket
  s3_key                   = var.lambda_layer_repository_s3_key
  s3_object_version        = var.lambda_layer_object_version
  skip_destroy             = false
  compatible_architectures = ["x86_64", "arm64"]
  compatible_runtimes      = ["python3.7", "python3.8", "python3.9"]
}

######################################## Lambda Function ###########################################
resource "aws_lambda_function" "lambda-function" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  layers                         = [aws_lambda_layer_version.lambda-layer.arn]
  function_name                  = local.lambda_function_name
  description                    = var.lambda_function_description
  role                           = aws_iam_role.lambda-iam-role.arn
  handler                        = "taurus_code.lambda_handler"
  memory_size                    = var.memory_size
  timeout                        = var.timeout
  runtime                        = var.runtime
  s3_bucket                      = var.lambda_code_repository_s3_bucket
  s3_key                         = var.lambda_code_repository_s3_key
  s3_object_version              = var.lambda_code_object_version
  reserved_concurrent_executions = var.reserved_concurrent_executions
  tags                           = local.tags
}


# source_code_hash               = data.archive_file.package_zip.output_base64sha256