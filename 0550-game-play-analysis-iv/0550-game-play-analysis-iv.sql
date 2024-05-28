with first_order as (
    select player_id,min(event_date)as first_date from Activity
    group by player_id
),
summary as(
    select s.player_id,s.event_date
    from Activity as s
    join first_order as f
    on f.player_id=s.player_id
    where DATE_ADD(f.first_date , INTERVAL 1 DAY)=s.event_date
)
select round(count(*)/(select count(distinct player_id) from Activity ),2) as fraction from summary;