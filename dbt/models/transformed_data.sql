
-- The transformations include:
-- 1. Converting Unix timestamps (Start_time, End_time) to DATETIME.
-- 2. Converting distance from miles to kilometers.
-- 3. Converting temperature from Fahrenheit to Celsius.
-- 4. Handling missing values in 'Weather_Condition' and 'Sunrise_Sunset' columns.
-- 5. Replacing empty strings with NULL where applicable.
-- 6. Creating a new model with the transformed data.


  SELECT
    ID,
    DATETIME(TIMESTAMP_SECONDS(Start_time)) AS Start_datetime, 
    DATETIME(TIMESTAMP_SECONDS(End_time)) AS End_datetime,     
    distance_mi,
    distance_mi * 1.60934 AS distance_km,  -- Conversion: Miles to Kilometers.
    temperature_f,
    (temperature_f - 32) * 5/9 AS temperature_c,  -- Conversion: Fahrenheit to Celsius.
    NULLIF(Weather_Condition, 'Unknown') AS Weather_Condition,  
    NULLIF(Sunrise_Sunset, 'Unknown') AS Sunrise_Sunset,
    NULLIF(Description, '') AS Description,  
    NULLIF(Street, '') AS Street,  
    NULLIF(City, '') AS City,  
    NULLIF(County, '') AS County,  
    NULLIF(State, '') AS State,  
    NULLIF(Zipcode, '') AS Zipcode,  
    NULLIF(Country, '') AS Country,  
    NULLIF(Timezone, '') AS Timezone,  
    NULLIF(Airport_Code, '') AS Airport_Code
  FROM
    `gcp-streaming-pipeline.project_parquet.cab_trips`
