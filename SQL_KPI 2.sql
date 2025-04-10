#2. Number of orders with review score 5 and payment type as credit card.

select * from Ecommerce_site.olist_order_payments_dataset;
select * from Ecommerce_site.olist_order_reviews_dataset;

select
count(pmt.order_id) as Total_Orders
from
olist_order_payments_dataset pmt
inner join olist_order_reviews_dataset rev on pmt.order_id = rev.order_id
where
rev.review_score = 5
and pmt.payment_type = 'credit_card';