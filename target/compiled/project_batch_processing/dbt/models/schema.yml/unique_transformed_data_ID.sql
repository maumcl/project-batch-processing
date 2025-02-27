
    
    

with dbt_test__target as (

  select ID as unique_field
  from `gcp-streaming-pipeline`.`project_parquet`.`transformed_data`
  where ID is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


