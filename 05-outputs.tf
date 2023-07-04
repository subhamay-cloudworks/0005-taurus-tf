## ---------------------------------------------------------------------------------------------------------------------
## Output Definition                    - Project Taurus
## Project Description                  - Creating a Lambda Layer and adding the same to a Lambda function.
## Modification History:
##   - 1.0.0    Jul 04,2023 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------

######################################## Lambda IAM Policy #########################################
output "taurus_lambda_iam_role_arn" {
  value = aws_iam_role.lambda-iam-role.arn
}
output "taurus_lambda_iam_assume_role_policy" {
  value = aws_iam_role.lambda-iam-role.assume_role_policy
}
output "taurus_lambda_iam_assume_role_tags_all" {
  value = aws_iam_role.lambda-iam-role.tags_all
}
######################################## Lambda Layer ##############################################
output "taurus_lambda_lambda_layer_id" {
  value = aws_lambda_layer_version.lambda-layer.id
}
output "taurus_lambda_layer_name" {
  value = aws_lambda_layer_version.lambda-layer.layer_name
}
output "taurus_lambda_layer_arn" {
  value = aws_lambda_layer_version.lambda-layer.arn
}
output "taurus_lambda_layer_compatible_architectures" {
  value = aws_lambda_layer_version.lambda-layer.compatible_architectures
}
output "taurus_lambda_layer_compatible_runtimes" {
  value = aws_lambda_layer_version.lambda-layer.compatible_runtimes
}
output "taurus_lambda_layer_compatible_created_date" {
  value = aws_lambda_layer_version.lambda-layer.created_date
}
output "taurus_lambda_layer_compatible_description" {
  value = aws_lambda_layer_version.lambda-layer.description
}
output "taurus_lambda_layer_license_info" {
  value = aws_lambda_layer_version.lambda-layer.license_info
}
######################################## Lambda Function ###########################################
output "taurus_lambda_function_arn" {
  value = aws_lambda_function.lambda-function.arn
}
output "taurus_lambda_function_invoke_arn" {
  value = aws_lambda_function.lambda-function.invoke_arn
}
output "taurus_lambda_function_last_modified" {
  value = aws_lambda_function.lambda-function.last_modified
}
output "taurus_lambda_function_qualified_arn" {
  value = aws_lambda_function.lambda-function.qualified_arn
}
output "taurus_lambda_function_tags_all" {
  value = aws_lambda_function.lambda-function.tags_all
}