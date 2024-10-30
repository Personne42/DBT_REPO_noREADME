--- For the sales data, we can use the revenue attribute from the sales.sql

--- We add the merged query into this sheet to have a clear lineage

--- First we make the join of the identified tables (cf. int_sales_margin.sql)


SELECT *,
(CAST(purchse_price AS FLOAT64) * quantity) AS purchase_costs,
(revenue - (CAST(purchse_price AS FLOAT64) * quantity)) AS margin
FROM {{ ref('stg_raw__sales') }}
LEFT JOIN {{ ref('stg_raw__products') }}
    USING (products_id)
