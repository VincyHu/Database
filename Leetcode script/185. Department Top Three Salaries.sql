# 185. Department Top Three Salaries
WITH sub AS
(SELECT 
	d.name as department,
    e.name as employee,
    e.salary,
    DENSE_RANK() OVER (PARTITION BY d.name
                 ORDER BY salary desc) as salary_rank
FROM department d LEFT JOIN employee e
	ON d.id = e.departmentid
)
SELECT department, employee, salary
FROM sub
WHERE salary_rank <4
;


