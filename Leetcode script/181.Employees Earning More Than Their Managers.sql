/* 181.Employees Earning More Than Their Managers */
 
SELECT emp.Name AS Employee
FROM EMPLOYEE emp LEFT JOIN EMPLOYEE man
ON emp.ManagerId = man.Id
WHERE emp.Salary > man.Salary
;