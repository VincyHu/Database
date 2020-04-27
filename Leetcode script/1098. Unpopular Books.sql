/*1098. Unpopular Books */
# no subquery, only join
SELECT 
    b.book_id
  , b.name
FROM books b LEFT JOIN orders o
    On b.book_id = o.book_id AND o.dispatch_date BETWEEN "2018-06-23" AND "2019-06-23" 
    #THEN only count in the sales in the past year,
WHERE DATEDIFF('2019-06-23', b.available_from) >30 #First find books available longer than 30 days
GROUP BY b.book_id
HAVING SUM(o.quantity) < 10 or SUM(o.quantity) is null 
							#the null value should also be considered since it represents no sales
;