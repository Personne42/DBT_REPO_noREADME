{{ config( materialized='table')}}

SELECT operational_orders.date_date,
COUNT(orders_id) AS nbr_orders_daily,
SUM(revenue) AS revenue_daily,
(SUM(revenue)/COUNT(orders_id)) AS avg_basket,
SUM(Operational_margin) AS Operational_margin_daily,
SUM(CAST(shipping_fee AS FLOAT64)) AS shipping_fee_daily,
SUM(CAST(logcost AS FLOAT64)) AS log_cost_daily,
SUM(operational_orders.quantity) AS quantity_daily,
FROM {{ ref('int_orders_operational') }} AS operational_orders
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship
USING (orders_id)
LEFT JOIN {{ ref('int_sales_margin') }} AS sales_margin
USING (orders_id)
GROUP BY date_date