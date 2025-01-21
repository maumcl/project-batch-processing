{{ config(
    materialized='incremental',
    unique_key='ID'  
) }}

with raw_uber_data as (
    select * from `gcp-streaming-pipeline.project_parquet.transformed_data`
)

SELECT
    ID,
    Start_datetime,
    EXTRACT(YEAR FROM Start_datetime) as year,
    End_datetime,     
    distance_mi,
    distance_km,
    temperature_f,
    Weather_Condition,  
    Sunrise_Sunset,
    Description,  
    Street,  
    City,  
    County,  
    State,  
    Zipcode,  
    Country,  
    Timezone,  
    Airport_Code
    -- Add more transformations here as necessary
from raw_uber_data

{% if is_incremental() %}
    -- Incremental logic: filter only rows where year > 2019
    where EXTRACT(YEAR FROM Start_datetime) > 2019
{% endif %}
