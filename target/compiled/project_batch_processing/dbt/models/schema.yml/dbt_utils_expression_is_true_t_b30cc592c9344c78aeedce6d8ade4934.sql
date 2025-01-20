



select
    1
from `gcp-streaming-pipeline`.`project_parquet`.`transformed_data`

where not(distance_km distance_km > 0)

