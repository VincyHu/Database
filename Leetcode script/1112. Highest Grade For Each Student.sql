/*1112. Highest Grade For Each Student*/
WITH TEMP AS
(SELECT student_id
	 , course_id
     , grade
     , RANK() OVER (PARTITION BY student_id
                    ORDER BY grade DESC, course_id) AS n_rank
FROM enrollments)
SELECT student_id
	 , course_id
     , grade
FROM temp 
WHERE n_rank = 1;