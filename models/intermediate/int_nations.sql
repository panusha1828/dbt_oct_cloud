{{
    config(
        materialized = 'incremental',
        unique_key = 'nation_id',
        on_schema_change = 'sync_all_columns'
    )
}}

with nation as(

select 
nation_id,
name,
region_id,

updated_at
from {{ref("stg_nations")}}

)

select * from nation
