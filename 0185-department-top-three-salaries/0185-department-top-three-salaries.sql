WITH salary AS (
    SELECT 
        e.id AS employee_id,
        e.name AS employee_name,
        e.salary,
        e.departmentId,
        d.id AS department_id,
        d.name AS department_name,
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY salary DESC) AS `rank`
    FROM 
        Employee e 
    LEFT JOIN 
        Department d ON e.departmentId = d.id
)
SELECT department_name as Department,employee_name as Employee,salary as Salary FROM salary WHERE `rank` <= 3;