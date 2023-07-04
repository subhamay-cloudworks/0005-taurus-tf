## ---------------------------------------------------------------------------------------------------------------------
## Variables Definition                 - Project Taurus
## Project Description                  - Creating a Lambda Layer and adding the same to a Lambda function.
## Modification History:
##   - 1.0.0    Jul 04,2023 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------


######################################## Project Name ##############################################
variable "project_name" {
  description = "The name of the project"
  type        = string
}
######################################## Environment Name ##########################################
variable "environment_name" {
  type        = string
  description = <<EOT
  (Optional) The environment in which to deploy our resources to.

  Options:
  - devl : Development
  - test: Test
  - prod: Production

  Default: devl
  EOT
  default     = "devl"

  validation {
    condition     = can(regex("^devl$|^test$|^prod$", var.environment_name))
    error_message = "Err: environment is not valid."
  }
}
######################################## Lambda Layer ###########################################
variable "lambda_layer_repository_s3_key" {
  description = "Lambda Layer code zip file s3 key"
  type        = string
}
variable "lambda_layer_object_version" {
  description = "S3 object version of the Lambda Layer code zip file"
  type        = string
}
######################################## Lambda Function ###########################################
variable "lambda_function_base_name" {
  description = "The base name of the Lambda Function"
  type        = string
}
variable "lambda_function_description" {
  description = "The description of the lambda function"
  type        = string
}

variable "lambda_iam_role_name" {
  description = "The name of the Lambda IAM Role"
  type        = string
}

variable "lambda_iam_policy_name" {
  description = "The name of the Lambda IAM Policy"
  type        = string
}

variable "lambda_code_repository_s3_bucket" {
  description = "S3 Bucket used as code repository"
  type        = string
}

variable "lambda_code_repository_s3_key" {
  description = "Lambda code zip file s3 key"
  type        = string
}
variable "lambda_code_object_version" {
  description = "S3 object version of the Lambda code zip file"
  type        = string
}

variable "memory_size" {
  description = "The allocated memory size of the lambda function in MB"
  type        = number
}

variable "runtime" {
  description = "The runtime the lambda function"
  type        = string
}

variable "timeout" {
  description = "The timeout period of the lambda function in seconds"
  type        = number
}

variable "reserved_concurrent_executions" {
  description = "The reserved concurrency for the lambda function."
  type        = number
}
######################################## Lambda Layer ##############################################
variable "lambda_layer_base_name" {
  description = "The base name of the Lambda Layer"
  type        = string
}