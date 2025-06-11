{{ config(
    materialized='table',
    description='Dimension table for products'
) }}

SELECT
  product_id,
  product_name,
  category,
  price
FROM {{ ref('int_product_price_cleaned') }}
