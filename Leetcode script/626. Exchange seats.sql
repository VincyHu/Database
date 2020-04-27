/*626. Exchange Seats*/
WITH sub as
(
SELECT
    id
  , student
  , CASE WHEN id mod 2 !=0 
              THEN LEAD(student,1) OVER(order by id)
              ELSE LAG(student,1) OVER(order by id)
              END as new_student
FROM seat)
SELECT id, coalesce(new_student,student) as student
FROM sub
ORDER BY id
;

