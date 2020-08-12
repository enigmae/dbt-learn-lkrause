select p.orderid as order_id,
p.amount /100 as amount,
o.customer_id
from raw.stripe.payment as p
left join {{ref('stg_orders')}} as o
on p.orderid = o.order_id
where p.status = 'success'