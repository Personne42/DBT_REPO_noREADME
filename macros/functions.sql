{% macro cte_margin_percent(purchase_costs, revenue) %}
    SAFE_DIVIDE( {{revenue}} - {{purchase_costs}}, {{revenue}})
{% endmacro %}