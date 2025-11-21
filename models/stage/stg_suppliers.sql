   
{{
config(
materialized='ephemeral'
   )

}}
   
   with sup as

       (
        select
        -- ids
        s_suppkey as supplier_id,
        s_nationkey as nation_id,

        -- descriptions
        sname as supplier_name,
        s_address as supplier_address,
        s_phone as phone_number,
        s_comment as comment,

        -- amounts
        s_acctbal as account_balance,
        updated_time
        from {{source('src','SUPPLIERS')}} s1
        left join {{ source('src2', 'SUPPLIERS') }} s2
        on s1.s_suppkey = s2.skey

        )

select * from sup