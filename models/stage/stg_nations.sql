{{
    config(
        query_tag = 'test1',
        alias= this.name+ var('v_id'),
        access = 'public'
    )
}}
with nation as(

select 

N_NATIONKEY::varchar as nation_id,
N_NAME as name,
N_REGIONKEY as region_id,
UPDATED_AT 

from {{source('src','nations')}}

)

select * from nation
