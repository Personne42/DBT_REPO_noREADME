-- We now want to calculate the operational margin with the formula:

-- Operational_margin = margin + shipping_fee - log_cost - ship_cost

SELECT orders_id, date_date, quantity,
ROUND((margin + CAST(shipping_fee AS FLOAT64) - CAST(logcost AS FLOAT64) - CAST(ship_cost AS FLOAT64)),2) AS Operational_margin
FROM {{ ref('int_orders_margin') }}
LEFT JOIN {{ ref('stg_raw__ship') }}
USING (orders_id) 
