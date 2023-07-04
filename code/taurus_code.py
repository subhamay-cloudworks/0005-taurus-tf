import json
import my_lib as my_lib

def lambda_handler(event, context):

    my_function_output = my_lib.my_function()

    print(f"my_function_output = {my_function_output}")

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda with Layer!')
    }
