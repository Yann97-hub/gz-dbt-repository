SELECT
  m.orders_id,
  m.date_date,
  m.margin,
  s.shipping_fee,
  s.logcost,
  CAST(s.ship_cost AS FLOAT64) AS ship_cost,
  m.margin + s.shipping_fee - s.logcost - CAST(s.ship_cost AS FLOAT64) AS operational_margin
FROM {{ ref('int_orders_margin') }} AS m
LEFT JOIN {{ ref('stg_raw__ship') }} AS s
  ON m.orders_id = s.order_id