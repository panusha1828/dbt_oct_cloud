{{
    config(
        materialized = 'dynamic_table',
        target_lag = '5 minutes',
        snowflake_warehouse = 'TRANSFORM_WH',
        refresh_mode = 'INCREMENTAL'
    )
}}

with customer as (

    select
        c_custkey      as customer_id,
        c_nationkey    as nation_id,
        c_acctbal      as account_balance
    from {{ source("src", "customers") }}

),

nation as (

    select
        N_NATIONKEY::varchar as nation_id,
        N_NAME                as nation_name
    from {{ source("src", "nations") }}

)

select
    n.nation_name,
    count(distinct c.customer_id)       as total_customers,
    sum(c.account_balance)              as total_account_balance
from nation n
join customer c 
    on n.nation_id = c.nation_id
group by n.nation_name
order by total_customers desc
