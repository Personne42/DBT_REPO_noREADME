{% macro cte_margin_percent(revenue, purchase_costs) %}
    (revenue - purchse_costs) AS margin,
    SAFE_DIVIDE(margin/revenue) AS margin_percent
{% endmacro %}