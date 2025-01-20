
    select *
    from `gcp-streaming-pipeline`.`project_parquet`.`transformed_data`
    where distance_mi < 0
