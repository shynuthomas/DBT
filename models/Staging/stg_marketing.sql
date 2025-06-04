{{ config(materialized='view') }}

with source as (

    select
        campaign_id,
        channel,
        start_date,
        end_date,
        budget,
        impressions,
        clicks
    from {{ source('raw', 'marketing') }}

),

cleaned as (

    select
        campaign_id,
        lower(trim(channel)) as channel,
        start_date,
        end_date,
        budget,
        impressions,
        clicks,

        -- Derived metrics
        date_diff(end_date, start_date, day) as campaign_duration_days,
        safe_divide(clicks, impressions) as click_through_rate

    from source

)

select * from cleaned
