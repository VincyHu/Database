/*180 consecutive numbers */
WITH sub as
(
SELECT num
	 , LAG(num,1) OVER () AS lag_1_num
     , LAG(num,2) OVER () AS lag_2_num
FROM logs
)
SELECT num
FROM sub
WHERE num = lag_1_num AND lag_1_num = lag_2_num
;


