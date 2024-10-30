{% macro cte_margin_percent(revenue, purchase_costs) %}
    margin = (revenue - purchase_costs)
    margin_percent = SAFE_DIVIDE(margin/revenue)
{% endmacro %}