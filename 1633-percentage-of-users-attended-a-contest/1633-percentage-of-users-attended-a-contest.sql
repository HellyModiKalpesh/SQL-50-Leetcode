SELECT 
    contest_id,
    round((COUNT(u.user_id) / (select count(distinct user_id) from Users))* 100,2) AS percentage 
FROM 
    Register AS r 
LEFT JOIN 
    Users AS u ON r.user_id = u.user_id 
GROUP BY 
    contest_id 
ORDER BY 
     percentage desc,contest_id asc ;
