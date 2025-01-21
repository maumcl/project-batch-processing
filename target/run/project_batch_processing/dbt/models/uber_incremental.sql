-- back compat for old kwarg name
  
  
        
            
            
        
    

    

    merge into `gcp-streaming-pipeline`.`project_parquet`.`uber_incremental` as DBT_INTERNAL_DEST
        using (

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


    -- Incremental logic: filter only rows where year > 2019
    where EXTRACT(YEAR FROM Start_datetime) > 2019

        ) as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.ID = DBT_INTERNAL_DEST.ID
            )

    
    when matched then update set
        `ID` = DBT_INTERNAL_SOURCE.`ID`,`Start_datetime` = DBT_INTERNAL_SOURCE.`Start_datetime`,`year` = DBT_INTERNAL_SOURCE.`year`,`End_datetime` = DBT_INTERNAL_SOURCE.`End_datetime`,`distance_mi` = DBT_INTERNAL_SOURCE.`distance_mi`,`distance_km` = DBT_INTERNAL_SOURCE.`distance_km`,`temperature_f` = DBT_INTERNAL_SOURCE.`temperature_f`,`Weather_Condition` = DBT_INTERNAL_SOURCE.`Weather_Condition`,`Sunrise_Sunset` = DBT_INTERNAL_SOURCE.`Sunrise_Sunset`,`Description` = DBT_INTERNAL_SOURCE.`Description`,`Street` = DBT_INTERNAL_SOURCE.`Street`,`City` = DBT_INTERNAL_SOURCE.`City`,`County` = DBT_INTERNAL_SOURCE.`County`,`State` = DBT_INTERNAL_SOURCE.`State`,`Zipcode` = DBT_INTERNAL_SOURCE.`Zipcode`,`Country` = DBT_INTERNAL_SOURCE.`Country`,`Timezone` = DBT_INTERNAL_SOURCE.`Timezone`,`Airport_Code` = DBT_INTERNAL_SOURCE.`Airport_Code`
    

    when not matched then insert
        (`ID`, `Start_datetime`, `year`, `End_datetime`, `distance_mi`, `distance_km`, `temperature_f`, `Weather_Condition`, `Sunrise_Sunset`, `Description`, `Street`, `City`, `County`, `State`, `Zipcode`, `Country`, `Timezone`, `Airport_Code`)
    values
        (`ID`, `Start_datetime`, `year`, `End_datetime`, `distance_mi`, `distance_km`, `temperature_f`, `Weather_Condition`, `Sunrise_Sunset`, `Description`, `Street`, `City`, `County`, `State`, `Zipcode`, `Country`, `Timezone`, `Airport_Code`)


    