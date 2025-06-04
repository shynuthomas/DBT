{{ config(materialized='view') }}

with source as (

    select
        product_id,
        product_name,
        category,
        price
    from {{ source('raw', 'products') }}

),

cleaned as (

    select
        product_id,
        initcap(trim(product_name)) as product_name,
        upper(trim(category)) as category,
        price

    from source

)

select * from cleaned
