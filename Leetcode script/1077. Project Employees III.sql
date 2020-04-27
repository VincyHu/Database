/*1077. Project Employees III*/
WITH sub as
(SELECT
    p.project_id
    ,p.employee_id
    ,e.experience_years
    ,RANK() OVER (PARTITION BY project_id
				 ORDER BY experience_years DESC) as `rank`
FROM project p LEFT JOIN employee e
ON p.employee_id = e.employee_id)
SELECT project_id
     , employee_id
FROM sub
WHERE `rank` = 1
;