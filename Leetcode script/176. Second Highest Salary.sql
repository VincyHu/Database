/* 176. Second Highest Salary*/
# my first wrong attempt:
SELECT DISTINCT Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 1
;

# Correct
SELECT
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
       LIMIT 1 OFFSET 1) AS SecondHighestSalary
;