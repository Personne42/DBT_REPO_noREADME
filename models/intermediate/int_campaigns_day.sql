SELECT date_date,
SUM (ads_cost) AS ad_costs_daily,
SUM (impression) AS ad_imp,
SUM(click) AS ad_click,
FROM {{ ref('merged_ads_regie') }}
GROUP BY date_date
ORDER BY date_date DESC