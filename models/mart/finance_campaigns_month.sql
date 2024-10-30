WITH cte_month AS (
    SELECT *,
    DATE(EXTRACT(YEAR FROM date_date), EXTRACT(MONTH FROM date_date), 01) AS date_month
    FROM {{ ref('finance_campaigns_day') }}
)
SELECT date_month,
SUM(ad_costs) AS monthly_ad_costs,
SUM(ad_visibility) AS monthly_ad_visibility,
SUM(ad_efficiency) AS monthly_ad_efficiency,
SUM(new_operational_margin) AS monthly_new_op_margin,
SUM(nbr_orders_daily) AS monthly_nbr_orders_daily,
SUM(revenue_daily) AS monthly_revenue_daily,
SUM(avg_basket) AS monthly_avg_basket,
SUM(shipping_fee_daily) AS monthly_shipping_fee_daily,
SUM(log_cost_daily) AS monthly_log_cost_daily,
SUM(quantity_daily) AS monthl_quantity,
FROM cte_month
GROUP BY date_month