--- Locate the data needed for the quantity
SELECT *
FROM {{ ref('stg_raw__sales') }} --- the sum of float values into the sales.sql table can be used

--- Locate the data needed for the purchase price
SELECT *
FROM {{ ref('stg_raw__products') }} --- the attribute purchse_price from products.sql can be used 

--- For the sales data, we can use the revenue attribute from the sales.sql

--- We add the merged query into this sheet to have a clear lineage

--- First we make the join of the identified tables (cf. int_sales_margin.sql)

WITH 
cte_jointure
AS (
    SELECT *
    FROM {{ ref('stg_raw__sales') }}
    JOIN {{ ref('stg_raw__products') }}
    USING (products_id)
)
SELECT *,
(CAST(purchse_price AS FLOAT64) * quantity) AS purchase_costs,
(revenue - (CAST(purchse_price AS FLOAT64) * quantity)) AS margin
FROM cte_jointure