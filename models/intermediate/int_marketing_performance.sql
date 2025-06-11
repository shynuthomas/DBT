SELECT
  campaign_id,
  channel,
  start_date,
  end_date,
  budget,
  impressions,
  clicks,
  SAFE_DIVIDE(clicks, impressions) AS ctr,
  SAFE_DIVIDE(budget, clicks) AS cpc,
  SAFE_DIVIDE(budget, impressions / 1000.0) AS cpm
FROM {{ ref('stg_marketing') }}
