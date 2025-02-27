
    
    

with dbt_test__target as (

  select total_rides as unique_field
  from `gcp-streaming-pipeline`.`project_parquet`.`uber_top_cities`
  where total_rides is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


