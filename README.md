Still under construction

# Data Pipeline Project

This project demonstrates a comprehensive data pipeline workflow, including extracting data, transforming it, and loading it into a database for further analysis. The pipeline incorporates cloud storage, local processing, and database integration, using tools like PySpark and Google BigQuery.

## Project Structure

```
project-batch-processing/
├── data/
│   ├── raw/                   # Raw data downloaded from the source
│   ├── processed/             # Data after initial processing
│   └── processed-form-cloud/  # Final transformed data ready for database loading
├── notebooks/                 # Jupyter notebooks for data exploration and validation
│   ├── parquet_modified.ipynb # Transform the column names to fit in the BigQuery
├── scripts/                   # Python scripts for pipeline stages
│   ├── extract_data.py        # Extract data from cloud storage
│   ├── process_data.py        # Process the raw data
│   ├── transform_data.py      # Transform data locally using PySpark
│   ├── load_to_bigquery.py    # Load transformed data into BigQuery
│   └── save_to_gcp.py         # Upload files to Google Cloud Storage
│   ├── upload_to_aws.py       # Upload files to AWS S3
│   ├── load_to_bigquery.py    # Load transformed data into BigQuery
├── README.md                  # Project documentation
├── requirements.txt           # Python dependencies
└── .gitignore                 # Ignored files and directories
```

## Steps in the Project

## Steps in the Project

### 1. Download and Upload Uber Taxi Dataset
The project starts with downloading the Uber Taxi Yellow dataset and uploading it to Google Cloud Storage after initial processing with PySpark. This step ensures the data is clean and ready for further transformations - of course, picking the columns we may use during our analysis.

### 2. Extract Cleaned Data
Extract the cleaned Parquet files from Google Cloud Storage to a local directory for further processing.

### 3. Transform Data Further
Perform additional transformations on the Parquet files using PySpark. This includes tasks like filtering, aggregations, and column manipulations.

### 4. Load Data into a Database
Upload the transformed data to a BigQuery database for analysis and visualization.

### 5. Integrate Streaming with Kafka
(Optional) Implement a streaming pipeline using Apache Kafka for real-time data ingestion.

### 6. Set Up an ETL Workflow
Create an ETL workflow using a scheduler like Apache Airflow to automate the pipeline.

### 7. Document Your Project
Maintain comprehensive documentation of the project, including how to set up, run, and maintain the pipeline.

### 8. Deploy the Pipeline
Deploy the pipeline in a production environment and ensure monitoring and scalability.

## Technologies Used

- **PySpark**: For data processing and transformation
- **Google Cloud Platform (GCP)**: For cloud storage and BigQuery database
- **Apache Kafka**: For streaming data (optional)
- **Apache Airflow**: For workflow automation (optional)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your_username/project-batch-processing.git
   cd project-batch-processing
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your environment variables for cloud services:
   - **Google Cloud**: `GOOGLE_APPLICATION_CREDENTIALS` pointing to your JSON key file
   - **AWS**: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`

## Usage

### Extract Data
Run the script to download data from GCP:
```bash
python scripts/extract.py
```

### Transform Data
Process and clean the data:
```bash
python scripts/transform.py
```

### Load Data
Load the processed data into BigQuery:
```bash
python scripts/load_to_bigquery.py
```
