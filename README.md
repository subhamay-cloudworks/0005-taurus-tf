# Project Taurus : Lambda Layer Demo


## Description

This is demonstration of a creating a Lambda layer with a custom Python library and adding the same to a Lambda function. The entire stack is created using HashiCorp Terraform


### Installing

### Installing

* Clone the repository https://github.com/subhamay-cloudworks/0005-tarus-tf
* Create a S3 bucket to store the Lambda code zip file.
* From the Command line, zip the Python library code/python/my_lib.py including the python folder.
```
cd code
zip -r my_lib.zip python/my_lib.py
```
* Zip and Upload the following Python file  to taurus/code/python in the S3 bucket.
    * taurus_code.py (taurus_code.zip)
    * my_lib.py (my_lib.zip)

* Modify the terraform.tfvars with the appropriate names.
* From the main project diretory submit the following commands:
```
terraform init

terraform validate 

terraform plan

terraform apply -auto-approve

# To delete the stack 
terraform destroy -auto-approve
```

### Executing program

* Execute the Lambda function either from AWS Lambda console or AWS CLI.

## Help
Post message in my blog (https://blog.subhamay.com)

## Authors

Contributors names and contact info

Subhamay Bhattacharyya  - [subhamay.aws@gmail.com](https://blog.subhamay.com)

## Version History

* 0.1
    * Initial Release

## License

This project is licensed under Subhamay Bhattacharyya. All Rights Reserved.

