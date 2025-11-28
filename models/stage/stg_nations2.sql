
with nation as(

select 

N_NATIONKEY as nation_id,
N_NAME as name,
N_REGIONKEY as region_id,
UPDATED_AT ,
{{dbt_meta()}}

from {{source('src','nations')}}

)

select * from nation
