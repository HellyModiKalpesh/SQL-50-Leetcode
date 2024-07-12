-- # Write your MySQL query statement below
with detail as 
(select product_id,
new_price,
Rank()over(PARTITION BY product_id order by change_date desc) as rnk 
from Products where change_date<='2019-08-16'
)
select product_id,new_price as price from detail where rnk=1
Union
select product_id,10 as price from Products where product_id not in (
    select product_id from Products where change_date<='2019-08-16')
