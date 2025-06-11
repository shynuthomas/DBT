{{ config(
    materialized='table',
    description='Marketing campaign performance metrics'
) }}

SELECT *
FROM {{ ref('int_marketing_performance') }}
