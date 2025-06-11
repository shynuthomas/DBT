SELECT *
FROM {{ ref('stg_customers') }}
WHERE is_active = TRUE
