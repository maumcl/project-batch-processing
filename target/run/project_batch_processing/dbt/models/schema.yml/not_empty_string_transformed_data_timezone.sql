select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    select
        *
    from `gcp-streaming-pipeline`.`project_parquet`.`transformed_data`
    where timezone = ''

      
    ) dbt_internal_test