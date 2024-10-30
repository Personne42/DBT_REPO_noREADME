-- SELECT *
-- FROM {{ ref('int_sales_margin') }}

--- We want a TCD to have the cumulated sum of Biz KPIS + Rounded values
SELECT orders_id, date_date,
    SUM(revenue) AS revenue,
    SUM (quantity) AS quantity,
    ROUND(SUM (purchase_costs),2) AS purchase_costs,
    ROUND(SUM (margin),2) AS margin,
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id, date_date