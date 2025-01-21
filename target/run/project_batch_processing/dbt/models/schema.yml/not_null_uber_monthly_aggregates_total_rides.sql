select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_rides
from `gcp-streaming-pipeline`.`project_parquet`.`uber_monthly_aggregates`
where total_rides is null



      
    ) dbt_internal_test