import json
import os
import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError

# Load AWS credentials from the config file
with open('/home/mauricio/git/project-batch-processing/configs/aws_credentials.py') as f:
    aws_credentials = json.load(f)

# Initialize S3 client
s3_client = boto3.client(
    's3',
    aws_access_key_id=aws_credentials['aws_access_key_id'],
    aws_secret_access_key=aws_credentials['aws_secret_access_key'],
    region_name=aws_credentials['region_name']
)

# Function to upload files to S3
def upload_file_to_s3(local_file, s3_bucket, s3_key):
    try:
        # Upload the file
        s3_client.upload_file(local_file, s3_bucket, s3_key)
        print(f"Successfully uploaded {local_file} to s3://{s3_bucket}/{s3_key}")
    except NoCredentialsError:
        print("No AWS credentials found. Please configure your AWS credentials.")
    except PartialCredentialsError:
        print("Incomplete AWS credentials found. Please check your configuration.")
    except Exception as e:
        print(f"Error uploading file: {e}")


# Function to upload entire folder
def upload_folder_to_s3(local_folder, s3_bucket, s3_folder):
    for root, dirs, files in os.walk(local_folder):
        for file in files:
            # Generate the relative path of the file in the local folder
            local_file = os.path.join(root, file)

            # Create the relative path for S3 key (maintains the folder structure)
            relative_path = os.path.relpath(local_file, local_folder)
            s3_key = os.path.join(s3_folder, relative_path)

            # Upload the file to S3
            upload_file_to_s3(local_file, s3_bucket, s3_key)


# Example usage
local_folder_path = "/home/mauricio/git/project-batch-processing/data/processed"
s3_bucket_name = "project-batch-processing"
s3_folder = "data_processed"  # The S3 folder where the files will be uploaded

# Upload the entire folder
upload_folder_to_s3(local_folder_path, s3_bucket_name, s3_folder)

