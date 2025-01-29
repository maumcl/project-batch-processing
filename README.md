# Data Pipeline Project

This project demonstrates a comprehensive data pipeline workflow, including extracting data, transforming it, and loading it into a database for further analysis. The pipeline incorporates cloud storage, local processing, and database integration, using tools like PySpark, dbt Google BigQuery.


## Steps in the Project

### 1. Download and Upload Uber Taxi Dataset
The project starts with downloading the Uber Taxi Yellow dataset and uploading it to Google Cloud Storage after initial processing with PySpark. This step ensures the data is clean and ready for further transformations - of course, picking the columns we're gonna use during our analysis.

### 2. Extract Cleaned Data
Extract the cleaned Parquet files from Google Cloud Storage to a local directory for further processing.

### 3. Transform Data Further
Perform additional transformations on the Parquet files using PySpark. This includes tasks like filtering, aggregations, and column manipulations.

### 4. Load Data into a Database
Upload the transformed data to a BigQuery database for analysis and visualization.

### 5. Create Aggregations and Views for Reporting
Created aggregated views and visualizations on Looker Studio for easier reporting and business insights.

### 6. Set Up an ETL Workflow
Create an ETL workflow using a scheduler like Apache Airflow to automate the pipeline.

### 7. Deploy the Pipeline
Deploy the pipeline in a production environment and ensure monitoring and scalability.

## Technologies Used

- **PySpark**: For data processing and transformation
- **Google Cloud Platform (GCP)**: For cloud storage, BigQuery and Looker Studio
- **Data Build Tool (DBT)**: For testing, modeling, and transforming data
 
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
python scripts/extract_data.py
```

### Transform Data
Process and clean the data:
```bash
python scripts/transform_data.py
```

### Load Data
Load the processed data into BigQuery:
```bash
python scripts/load_to_bigquery.py
```
