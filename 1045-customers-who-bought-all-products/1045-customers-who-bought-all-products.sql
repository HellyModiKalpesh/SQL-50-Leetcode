SELECT customer_id
FROM Customer 
GROUP BY 1
having count(distinct product_key)=(select count(distinct product_key) from Product);