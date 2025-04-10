#4. Average price and payment values from customers of Sao Paulo City.

SELECT * FROM Ecommerce_site.olist_order_items_dataset;
SELECT * FROM Ecommerce_site.olist_orders_dataset;
SELECT * FROM Ecommerce_site.olist_customers_dataset;
SELECT * FROM Ecommerce_site.olist_order_payments_dataset;

with order_item_avg as (
select round(avg(item.price)) as avg_order_item_price
from olist_order_items_dataset item
join olist_orders_dataset ord
on item.order_id = ord.order_id
join olist_customers_dataset cust on ord.customer_id = cust.customer_id
where cust.customer_city = "sao paulo"
)
select
(select avg_order_item_price from order_item_avg) as avg_order_item_price,
round(avg(pmt.payment_value)) as avg_payment_value
from olist_order_payments_dataset pmt
join olist_orders_dataset ord on pmt.order_id = ord.order_id
join olist_customers_dataset cust on ord.customer_id = cust.customer_id
where cust.customer_city = "sao paulo";
