SELECT *,
CONCAT(date_date, "-", campaign_key) AS test_primary,
FROM {{ ref('merged_ads_regie') }}