{{ config(
    materialized='table'
) }}

SELECT 
    DATE_TRUNC(Start_datetime, MONTH) AS ride_month,
    City,
    COUNT(ID) AS total_rides,
    AVG(distance_km) AS avg_distance
FROM 
    `gcp-streaming-pipeline.project_parquet.transformed_data`
GROUP BY 
    ride_month, 
    City
ORDER BY 
    ride_month, 
    City
