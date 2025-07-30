with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        CAST(shipping_fee AS FLOAT64) AS shipping_fee,
        CAST(ship_cost AS FLOAT64) AS ship_cost,
        logcost

    from source

)

select * from renamed
