{{ config(
    materialized='view',
    description='Orders enriched with customer details.'
) }}

WITH orders AS (
  SELECT * FROM {{ ref('stg_orders') }}
),
customers AS (
  SELECT * FROM {{ ref('stg_customers') }}
)

SELECT
  o.order_id,
  o.customer_id,
  c.first_name,
  c.last_name,
  o.order_date,
  o.order_status,
  o.order_amount
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
