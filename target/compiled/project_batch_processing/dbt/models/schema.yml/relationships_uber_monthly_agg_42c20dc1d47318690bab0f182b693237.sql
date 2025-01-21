
    
    

with child as (
    select total_rides as from_field
    from `gcp-streaming-pipeline`.`project_parquet`.`uber_monthly_aggregates`
    where total_rides is not null
),

parent as (
    select City as to_field
    from data_transformed
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


