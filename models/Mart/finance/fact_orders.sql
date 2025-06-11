{{ config(
    materialized='table',
    description='Fact table with enriched order information'
) }}

SELECT
  order_id,
  customer_id,
  first_name,
  last_name,
  order_date,
  order_status,
  order_amount
FROM {{ ref('int_orders_enriched') }}
