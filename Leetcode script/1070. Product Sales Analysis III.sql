/*1070. Product Sales Analysis III*/
SELECT product_id
     , year as first_year
     , quantity
     , price
FROM sales
WHERE year <= ALL(SELECT s2.year FROM sales s2
                WHERE sales.product_id = s2.product_id
               )
;