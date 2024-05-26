# Write your MySQL query statement below
select name from Employee where id in (select managerID from Employee GROUP BY managerID HAVING COUNT(managerID) >=5);