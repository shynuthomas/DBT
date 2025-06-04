{{ config(materialized='view') }}

with source as (

    select
        order_id,
        customer_id,
        order_date,
        order_status,
        order_amount
    from {{ source('raw', 'orders') }}

),

cleaned as (

    select
        order_id,
        customer_id,
        order_date,
        upper(trim(order_status)) as order_status,
        order_amount,

        -- Derived columns
        extract(year from order_date) as order_year,
        extract(month from order_date) as order_month

    from source

)

select * from cleaned
