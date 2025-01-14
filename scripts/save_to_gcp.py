import os
from google.cloud import storage


import logging
logging.basicConfig(level=logging.DEBUG)

BUCKET_NAME = "project-batch-processing"
FOLDERS_TO_UPLOAD = [
    "/home/mauricio/git/project-batch-processing/data/processed/"
]
GCS_BASE_FOLDER = "processed_files"

def upload_folder_to_gcs(local_folder, bucket_name, gcs_base_folder):
    client = storage.Client()
    bucket = client.get_bucket(bucket_name)

    for root, _, files in os.walk(local_folder):
        for file_name in files:
            local_file_path = os.path.join(root, file_name)
            relative_path = os.path.relpath(local_file_path, local_folder)
            gcs_path = os.path.join(gcs_base_folder, relative_path)
            blob = bucket.blob(gcs_path)

            print(f"Uploading {local_file_path} to {gcs_path}...")
            blob.upload_from_filename(local_file_path)
            print(f"Uploaded {local_file_path} to {gcs_path} successfully!")

def main():
    for folder in FOLDERS_TO_UPLOAD:
        print(f"Uploading folder: {folder}")
        upload_folder_to_gcs(folder, BUCKET_NAME, GCS_BASE_FOLDER)

if __name__ == "__main__":
    main()
