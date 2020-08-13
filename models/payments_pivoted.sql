{% set payment_method = ['credit_card', 'bank_transfer', 'coupon', 'gift_card'] %}
select
    orderid as order_id,
    {%- for payment in payment_method %}
    sum(case when paymentmethod = '{{ payment }}' then amount / 100 else 0 end) as {{ payment }}_amount
    {%- if not loop.last %} ,
    {%- endif %}
    {%- endfor %}
from raw.stripe.payment
group by 1