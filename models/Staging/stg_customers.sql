{{ config(materialized="view") }}

with
    source as (

        select
            customer_id,
            first_name,
            last_name,
            email,
            phone_number,
            city,
            state,
            country,
            signup_date,
            is_active
        from {{ source("demo", "customers") }}

    ),

    cleaned as (

        select
            customer_id,
            lower(trim(first_name)) as first_name,
            lower(trim(last_name)) as last_name,
            lower(trim(email)) as email,
            phone_number,
            initcap(trim(city)) as city,
            upper(trim(state)) as state,
            upper(trim(country)) as country,
            signup_date,
            is_active,

            -- Fixed: use CONCAT instead of CONCAT_WS
            concat(trim(first_name), ' ', trim(last_name)) as full_name,
            extract(year from signup_date) as signup_year

        from source

    )

select *
from cleaned
