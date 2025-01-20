select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ID
from `gcp-streaming-pipeline`.`project_parquet`.`transformed_data`
where ID is null



      
    ) dbt_internal_test