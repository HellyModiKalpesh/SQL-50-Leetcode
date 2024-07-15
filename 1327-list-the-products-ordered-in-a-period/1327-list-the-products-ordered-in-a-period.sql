# Write your MySQL query statement below
with detail as (
    select product_name,sum(unit) as unit from Orders join Products on Orders.product_id=Products.product_id
    WHERE MONTH(order_date) = 2 and YEAR(order_date)=2020
 group by Orders.product_id
  having unit >=100
)
select product_name,unit from detail