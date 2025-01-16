import pandas as pd
from google.cloud import bigquery
import dask.dataframe as dd

# Load the extracted data (replace with your actual file paths)
file_path = '/home/mauricio/git/project-batch-processing/data/processed-from-cloud/*.parquet'

# Read the Parquet file
df = dd.read_parquet(file_path)
df_result = df.compute()

# Perform transformations (e.g., cleaning, feature engineering)
df_clean = df.dropna()  # Example transformation
df_clean['new_column'] = df_clean['existing_column'] * 2  # Example transformation

# Load data into BigQuery
client = bigquery.Client()

dataset_id = 'your_project_id.your_dataset_name'
table_id = f'{dataset_id}.your_table_name'

# Load the transformed DataFrame into BigQuery
df_clean.to_gbq(destination_table=table_id, project_id='your_project_id', if_exists='replace')
