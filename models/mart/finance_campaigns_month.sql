SELECT *
FROM {{ ref('int_campaigns_day') }}

SELECT *
FROM {{ ref('finance_days') }}

SELECT date_date,
ad_costs_daily AS ad_costs,
ad_imp AS ad_visibility,
ad_click AS ad_efficiency,
(Operational_margin_daily - ad_costs_daily) AS new_operational_margin,
ROUND(nbr_orders_daily,2) AS nbr_orders_daily,
ROUND(revenue_daily,2) AS revenue_daily,
ROUND(avg_basket,2) AS avg_basket,
ROUND(shipping_fee_daily,2) AS shipping_fee_daily,
ROUND(log_cost_daily,2) AS log_cost_daily,
ROUND(quantity_daily,2) AS quantity_daily,
FROM {{ ref('int_campaigns_day') }}
JOIN {{ ref('finance_days') }}
USING(date_date)

# Utilisation de la macro pour générer le schema.yml
{{ codegen.generate_source(schema_name= 'finance_campaigns_month', database_name= 'mart') }}
