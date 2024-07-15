WITH daily_totals AS (
    SELECT visited_on, SUM(amount) as daily_amount
    FROM Customer
    GROUP BY visited_on
)
SELECT 
    visited_on,
    amount,
    ROUND(amount / 7, 2) AS average_amount
FROM (
    SELECT 
        visited_on,
        SUM(daily_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) as row_num
    FROM daily_totals
) subquery
WHERE row_num >= 7
ORDER BY visited_on;