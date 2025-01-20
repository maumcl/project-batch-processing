select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select airport_code
from `gcp-streaming-pipeline`.`project_parquet`.`transformed_data`
where airport_code is null



      
    ) dbt_internal_test