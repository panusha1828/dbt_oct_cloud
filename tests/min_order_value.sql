WITH orders AS (
    SELECT *
    FROM {{ ref('stg_orders') }}
)

SELECT order_id,total_price
FROM orders
where total_price <= 800
