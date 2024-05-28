# Write your MySQL query statement below
WITH first_order AS (
    SELECT 
        customer_id, 
        MIN(order_date) AS first_order_date
    FROM 
        Delivery
    GROUP BY 
        customer_id
),
first_order_details AS (
    SELECT 
        d.customer_id,
        d.order_date,
        CASE 
            WHEN d.order_date = d.customer_pref_delivery_date THEN 'immediate'
            ELSE 'scheduled'
        END AS order_type
    FROM 
        Delivery d
    JOIN 
        first_order f 
    ON 
        d.customer_id = f.customer_id AND d.order_date = f.first_order_date
)
select round(100*sum(CASE WHEN order_type = 'immediate' THEN 1 ELSE 0 END)/count(*),2) as immediate_percentage from first_order_details;