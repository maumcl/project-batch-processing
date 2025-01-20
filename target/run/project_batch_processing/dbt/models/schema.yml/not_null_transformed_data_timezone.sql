select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select timezone
from `gcp-streaming-pipeline`.`project_parquet`.`transformed_data`
where timezone is null



      
    ) dbt_internal_test