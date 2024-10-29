with

    source as (select * from {{ source("raw", "ship") }}),

    renamed as (

        select orders_id, shipping_fee, logcost, cast(ship_cost as float64) as ship_cost
        from source

    )

select *
from
    renamed  -- - atributs : orders_id, shipping_fee, shipping_fee_1, logcost, ship_cost

    -- - Since shipping_fee & shipping_fee_1 seem to be ISO, we would retrieve only
    -- one column by deleting the
    -- - shipping_fee_1 column (the schema is then updated by canclling this attribute)
    
