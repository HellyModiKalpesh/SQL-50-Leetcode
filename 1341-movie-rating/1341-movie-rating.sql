-- # Write your MySQL query statement below
(with rating as (
    select mr.movie_id,rating,u.user_id,u.name,count(*) as rating_no from MovieRating as mr join Users as u on mr.user_id=u.user_id group by u.user_id
)
select name as results from rating where rating_no=(select Max(rating_no) from rating) order by name asc limit 1
)

UNION ALL

(with ratings as
    (select mr.movie_id,rating,m.title,created_at,extract(month from created_at) as month,extract(year from created_at ) as year,avg(rating) as rate from MovieRating as mr join Movies as m on mr.movie_id=m.movie_id group by movie_id,month having month=2 and year=2020
    )
select title as results from ratings where rate=(select max(rate) from ratings) order by results asc limit 1)
