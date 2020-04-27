/*182. find duplication */ 

# Solution 1
SELECT Email
FROM
(SELECT DISTINCT Email,COUNT(Email) AS Count
FROM person 
Group By Email) AS sub
WHERE Count>1 
;

# Solution 2 More concise
SELECT Email
FROM Person
Group By Email
HAVING COUNT(Email)>1
;