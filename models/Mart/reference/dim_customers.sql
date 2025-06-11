{{ config(
    materialized='table',
    description='Dimension table for active customers'
) }}

SELECT
  customer_id,
  first_name,
  last_name,
  email,
  phone_number,
  city,
  state,
  country,
  signup_date
FROM {{ ref('int_customers_active') }}
