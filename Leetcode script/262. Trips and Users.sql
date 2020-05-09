/*262. Trips and Users*/
SELECT t.request_at as 'Day'
       , ROUND(IFNULL(SUM(CASE WHEN t.Status in ( 'cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END)/
       COUNT(t.id),0),2) as 'Cancellation rate'
FROM trips t 
LEFT JOIN users client
    ON t.client_id = client.users_id
LEFT JOIN users driver
    ON t.driver_id = driver.users_id
WHERE client.banned != "Yes" AND driver.banned != "Yes"
AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at
ORDER BY t.request_at
;