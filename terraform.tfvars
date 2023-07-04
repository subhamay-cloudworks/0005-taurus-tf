## ---------------------------------------------------------------------------------------------------------------------
## Terraform Variable Values            - Project Taurus
## Project Description                  - Creating a Lambda Layer and adding the same to a Lambda function.
## Modification History:
##   - 1.0.0    Jul 04,2023 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------


project_name                     = "taurus"
environment_name                 = "devl"
lambda_iam_role_name             = "lambda-iam-role"
lambda_iam_policy_name           = "lambda-iam-policy"
lambda_code_repository_s3_bucket = "subhamay-projects-repository-us-east-1"
lambda_code_repository_s3_key    = "0005-taurus/code/python/taurus_code.zip"
lambda_code_object_version       = "iFxnpiDeRXq9vU8TBjZvcRKFmmtgfa1Z"
lambda_function_base_name        = "demo-layer-lambda"
lambda_function_description      = "Taurus Lambda Layer Demo"
memory_size                      = 256
runtime                          = "python3.9"
timeout                          = 30
reserved_concurrent_executions   = 1
lambda_layer_base_name           = "demo-layer"
lambda_layer_repository_s3_key   = "0005-taurus/code/python/my_lib.zip"
lambda_layer_object_version      = "5pOpzoJSVLlWapR.0aVO91BwZ1EDmNpe"

######################################## Environment Name ##########################################
######################################## Project Name ##############################################
######################################## Lambda IAM Role ###########################################
######################################## Lambda Function ###########################################
######################################## Lambda Layer ##############################################