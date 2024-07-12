with entry as (
select 
    person_id,
    person_name,
    weight,
    turn,
    SUM(weight) OVER (ORDER BY turn) AS total
FROM Queue
)select person_name from entry where total <=1000 order by turn desc limit 1
