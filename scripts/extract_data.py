from google.cloud import storage
import os

def download_all_files_from_gcs(bucket_name, source_folder, destination_folder):
    """Download all files from a folder in GCS to a local directory."""
    # Initialize the storage client
    client = storage.Client()

    # Get the bucket
    bucket = client.get_bucket(bucket_name)

    # List all the files in the source folder
    blobs = bucket.list_blobs(prefix=source_folder)

    # Ensure destination folder exists
    os.makedirs(destination_folder, exist_ok=True)

    # Iterate over each file and download it
    for blob in blobs:
        # Get the file name (strip the folder path)
        destination_file_name = os.path.join(destination_folder, blob.name.split('/')[-1])

        # Skip directories (if any)
        if not blob.name.endswith('/'):  # Skip directories in GCS
            print(f"Downloading {blob.name} to {destination_file_name}")
            blob.download_to_filename(destination_file_name)
            print(f"Downloaded: {blob.name} to {destination_file_name}")

if __name__ == "__main__":
    # Set parameters for GCP storage
    bucket_name = 'project-batch-processing'  # GCS bucket name
    source_folder = 'processed_files/parquet_cleaned_data/'  # Folder in GCS containing the files
    destination_folder = '/home/mauricio/git/project-batch-processing/data/processed-from-cloud/'  # Local folder where the files will be saved

    # Call the function to download all files
    download_all_files_from_gcs(bucket_name, source_folder, destination_folder)
