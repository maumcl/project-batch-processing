

SELECT 
    City,
    COUNT(ID) AS total_rides
FROM 
    `gcp-streaming-pipeline.project_parquet.transformed_data`
GROUP BY 
    City
ORDER BY 
    total_rides DESC
LIMIT 5