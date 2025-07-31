{{config(materialized='table')}}

SELECT
    m.date_date,
    COUNT(m.orders_id) AS nb_transactions,
    ROUND(SUM(m.revenue), 2) AS total_revenue,
    ROUND(SUM(m.revenue) / COUNT(m.orders_id), 2) AS avg_basket,
    ROUND(SUM(o.operational_margin), 2) AS operational_margin,
    ROUND(SUM(m.purchase_cost), 2) AS total_purchase_cost,
    ROUND(SUM(s.shipping_fee), 2) AS total_shipping_fee,
    ROUND(SUM(s.logcost), 2) AS total_logcost,
    SUM(m.quantity) AS total_qty
    
FROM {{ref("int_orders_margin")}} AS m
JOIN {{ref("int_orders_operational")}} AS o
    USING(orders_id)
JOIN {{ref("stg_raw__ship")}} AS s
    USING(orders_id)
GROUP BY m.date_date
ORDER BY m.date_date DESC
