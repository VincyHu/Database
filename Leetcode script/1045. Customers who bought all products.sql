/*1045 Customers who bought all products*/
SELECT customer_id
FROM customer c 
GROUP BY customer_id
HAVING COUNT(distinct product_key)  = (SELECT COUNT(distinct product_key)
                                      FROM product)
;

