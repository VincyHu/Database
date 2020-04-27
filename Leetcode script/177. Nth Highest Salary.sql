/*177. Nth Highest Salary
In this question, I learn how to create and call function in local*/
# Create function:
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N=N-1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT Salary
      FROM Employee
      GROUP BY Salary
      ORDER BY Salary DESC
      LIMIT 1 OFFSET N
      
  );
END; 

# call function：
SELECT getNthHighestSalary(2);