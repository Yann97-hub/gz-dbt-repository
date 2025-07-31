WITH source AS (
    SELECT * FROM {{ source('raw', 'ship') }}
),

renamed AS (
    SELECT
        orders_id AS orders_id,  -- on standardise le nom
        CAST(shipping_fee AS FLOAT64) AS shipping_fee,
        CAST(ship_cost AS FLOAT64) AS ship_cost,
        logcost
    FROM source
)

SELECT * FROM renamed