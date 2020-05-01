/* 1158. Market Analysis I */
SELECT u.user_id as buyer_id
      ,u.join_date as join_date
      ,COUNT(o.order_id) as orders_in_2019
FROM users u LEFT JOIN orders o
    ON u.user_id = o.buyer_id AND YEAR(order_date) = 2019
GROUP BY u.user_id
;
