####  Trips and Users ####

SELECT t.Request_at as Day,
       ROUND(COUNT(CASE WHEN t.status = 'cancelled_by_driver' OR t.status = 'cancelled_by_client' THEN t.status END )/COUNT(*),2) as 'Cancellation Rate'
FROM trips t 
JOIN users u1 ON t.client_id = u1.users_id 
JOIN users u2 ON t.driver_id = u2.users_id
WHERE u1.banned = 'No' AND u2.banned = 'No' AND t.Request_at BETWEEN '2013-10-01' aND '2013-10-03'
GROUP BY t.Request_at
;

