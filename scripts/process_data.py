from pyspark.sql import SparkSession
from pyspark.sql.functions import col, count, when, mean

# Initialize Spark session
spark = SparkSession.builder \
    .appName("Read Dirty Dataset") \
    .getOrCreate()

# File path
file_path = "/home/mauricio/git/project-batch-processing/data/raw/US_Accidents_March23.csv"  # Replace with your file name

# Read the CSV file into a DataFrame
try:
    print(f"Reading file from {file_path}...")
    df = spark.read.csv(file_path, header=True, inferSchema=True)

    # Print schema
    print("Schema of the dataset:")
    df.printSchema()

    # Select specific columns 
    df_selected = df.select("ID", "Start_Time", "End_Time", "Distance(mi)", "Description", "Street", "City", "County", "State", "Zipcode", "Country", "Timezone", "Airport_Code", "Temperature(F)", "Weather_Condition", "Sunrise_Sunset")
    df_selected.show(2, truncate=False)

    # Convert data types
    df_selected = df_selected.withColumn('Start_time', col('Start_time').cast('integer'))  # Cast column to integer
    df_selected = df_selected.withColumn('End_time', col('End_time').cast('integer'))  


    # Fill missing values with an empty cell (empty string)
    df_selected = df_selected.fillna('')

    #  Remove duplicates
    df_selected = df_selected.dropDuplicates(['Start_Time', 'End_Time', 'Distance(mi)', 'Description', 'Street', 'City', 'County', 'State', 'Zipcode', 'Country', 'Timezone', 'Airport_Code', 'Temperature(F)', 'Weather_Condition', 'Sunrise_Sunset'])  

    # Show the first 2 rows of the df after all the process
    df_selected.show(2, truncate=False)

except Exception as e:
    print(f"Error reading the file: {e}")


# Path to save locally
local_csv_path = "/home/mauricio/git/project-batch-processing/data/processed/cleaned_data.csv"
local_parquet_path = "/home/mauricio/git/project-batch-processing/data/processed/cleaned_data.parquet"

# Save as CSV
df_selected.write.csv(local_csv_path, header=True, mode="overwrite")

# Save as Parquet
df_selected.write.parquet(local_parquet_path, mode="overwrite")

print("Cleaned data saved locally as CSV and Parquet.")


# Stop Spark session
spark.stop()



