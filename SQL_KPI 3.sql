#3. Average number of days taken from order_delivered_customer_date for pet_shop.

SELECT * FROM Ecommerce_site.olist_products_dataset;
SELECT * FROM Ecommerce_site.olist_orders_dataset;
SELECT * FROM Ecommerce_site.olist_order_items_dataset;

select
prod.product_category_name,
avg(datediff(ord.order_delivered_customer_date, ord.order_purchase_timestamp)) as Avg_delivery_days
from olist_orders_dataset ord
join
(SELECT product_id, order_id, product_category_name
from olist_products_dataset
join olist_order_items_dataset using(product_id)) as prod
on ord.order_id = prod.order_id
where prod.﻿product_category_name = "pet_shop"
group by prod.﻿﻿product_category_name ;