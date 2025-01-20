select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      



select
    1
from `gcp-streaming-pipeline`.`project_parquet`.`transformed_data`

where not(distance_km distance_km > 0)


      
    ) dbt_internal_test